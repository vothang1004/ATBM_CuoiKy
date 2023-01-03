package ego.wear.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import ego.wear.cart.ItemCart;
import ego.wear.model.ItemModel;
import ego.wear.model.OrderModel;
import ego.wear.model.UserModel;
import ego.wear.service.impl.ItemService;
import ego.wear.service.impl.OrderService;
import ego.wear.signature.RSA;
import ego.wear.signature.Sha256;
import ego.wear.util.SessionUtil;

/**
 * Servlet implementation class OrderController
 */
@WebServlet(urlPatterns = { "/order" })
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		String invoiceName = "";
		String signature = "";
		if (request.getParameter("invoiceName") != null) {
			invoiceName = request.getParameter("invoiceName");
		}
		if (request.getParameter("signature") != null) {
			signature = request.getParameter("signature");
		}

		if (!invoiceName.equals("") || !signature.equals("")) {
			// insert order into database
			UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "user");
			// validate signature
			String uploadPath = getServletContext().getRealPath("") + File.separator + "upload";
			File invoiceFile = new File(uploadPath + File.separator + invoiceName);
			byte[] data = Files.readAllBytes(invoiceFile.toPath());
			try {
				String hashDecrypted = RSA.decryptByPublicKey(signature, RSA.getAsPublicKey(user.getPublicKey()));
				String invoiceHashed = Sha256.hasingSHA256(data);
				if (hashDecrypted.equals(invoiceHashed)) {
					Map<Long, ItemCart> cart = (HashMap<Long, ItemCart>) SessionUtil.getInstance().getValue(request,
							"cart");
					ItemModel item = null;
					OrderModel orderFromSession = (OrderModel) SessionUtil.getInstance().getValue(request, "order");
					System.out.println("ORDER STATUS => " + orderFromSession.getStatus());
					SessionUtil.getInstance().removeValue(request, "order");
					OrderModel order = OrderService.getInstance().insert(orderFromSession);
					if (order != null) {
						// loop cart and insert item
						for (Map.Entry<Long, ItemCart> entry : cart.entrySet()) {
							item = new ItemModel(0, user.getUsername(), new Timestamp(System.currentTimeMillis()),
									"", null, entry.getValue().getName(), entry.getValue().getPrice(),
									entry.getValue().getQuantity(), entry.getKey(), order.getId(),
									entry.getValue().getSize());
							ItemService.getInstance().insert(item);
						}
						// remove cart
						SessionUtil.getInstance().removeValue(request, "cart");
						// insert address
						// AddressModel addressModel = new AddressModel(0, user.getUsername(),
						// new Timestamp(System.currentTimeMillis()),
						// "", null, province, district, village, detail, user.getId());
						// AddressService.getInstance().insert(addressModel);

						response.sendRedirect(request.getServletContext().getContextPath() +
								"/myorder");
					}
				}
			} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
					| BadPaddingException | InvalidKeySpecException e) {
				response.sendRedirect(request.getServletContext().getContextPath() +
						"/pay");
				e.printStackTrace();
			}

		} else {
			UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "user");
			Map<Long, ItemCart> cart = (HashMap<Long, ItemCart>) SessionUtil.getInstance().getValue(request, "cart");
			ItemModel item = null;
			if (cart != null) {
				// get parameters
				String province = request.getParameter("province").split("-")[0];
				String district = request.getParameter("district").split("-")[0];
				String village = request.getParameter("village");
				String detail = request.getParameter("detail");
				String note = request.getParameter("note");
				int totalPrice = 0;
				for (Map.Entry<Long, ItemCart> entry : cart.entrySet()) {
					totalPrice += entry.getValue().getTotalPrice();
				}
				// get three days after
				Date dt = new Date();
				Calendar c = Calendar.getInstance();
				c.setTime(dt);
				c.add(Calendar.DATE, 3);
				dt = c.getTime();
				OrderModel orderModel = new OrderModel(0, user.getUsername(), new Timestamp(System.currentTimeMillis()),
						"",
						null, totalPrice, "pending", new Timestamp(new Date().getTime()), new Timestamp(dt.getTime()),
						note,
						user.getId());
				SessionUtil.getInstance().putValue(request, "order", orderModel);
				// create file pdf

				try {
					// Create a new document
					Document document = new Document();
					Calendar cal = Calendar.getInstance();
					int day = cal.get(Calendar.DATE);
					int month = cal.get(Calendar.MONTH) + 1; // Calendar months are zero-based
					int year = cal.get(Calendar.YEAR);
					int hour = cal.get(Calendar.HOUR_OF_DAY);
					int minute = cal.get(Calendar.MINUTE);
					int second = cal.get(Calendar.SECOND);

					// Create a PDF writer and set the output file
					String uploadPath = getServletContext().getRealPath("") + File.separator + "upload";
					File uploadDir = new File(uploadPath);
					if (!uploadDir.exists())
						uploadDir.mkdir();

					String fileName = cal.getTimeInMillis() + "_" + user.getUsername() + "_invoice.pdf";

					PdfWriter.getInstance(document, new FileOutputStream(
							uploadDir.getAbsolutePath() + File.separator + fileName));

					// Open the document for writing
					document.open();

					// Add some content to the document

					document.add(new Paragraph("Invoice"));
					document.add(new Paragraph("Date: " + day + "/" + month + "/" + year));
					document.add(new Paragraph("Time: " + hour + ":" + minute + ":" + second));
					document.add(new Paragraph("Customer: " + user.getUsername()));
					document.add(new Paragraph(" ")); // Add a blank line

					// Create a table for the invoice items
					PdfPTable table = new PdfPTable(3); // 3 columns
					table.setWidthPercentage(100); // 100% width
					table.setSpacingBefore(10); // Space before the table

					// Set the column widths
					float[] columnWidths = { 1, 3, 2 };
					table.setWidths(columnWidths);

					// Add the table header
					Font boldFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
					PdfPCell cell = new PdfPCell();
					cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
					cell.setPadding(5);
					cell.setPhrase(new Phrase("Product quantity", boldFont));
					table.addCell(cell);
					cell.setPhrase(new Phrase("Product name", boldFont));
					table.addCell(cell);
					cell.setPhrase(new Phrase("Product price", boldFont));
					table.addCell(cell);

					// Add the invoice items
					for (Map.Entry<Long, ItemCart> entry : cart.entrySet()) {
						entry.getValue().getTotalPrice();
						table.addCell(entry.getValue().getQuantity() + "");
						table.addCell(entry.getValue().getName());
						table.addCell(entry.getValue().getPriceFormat());
					}
					document.add(table);
					// Close the document
					document.close();
					response.sendRedirect(
							request.getServletContext().getContextPath() + "/signuture-invoice?fileName=" + fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

}
