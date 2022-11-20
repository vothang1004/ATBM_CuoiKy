const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

function pagination(selector, { currentPage, numberPage }, url) {
    const paginationList = $(selector);
    let htmls = [];
    for (let i = 1; i <= numberPage; i++) {
        if (Math.abs(i - currentPage) <= 3) {
            if (i === currentPage) {
                htmls.push(`
                <li class="pagination__list-item"><a style="pointer-events: none" class="pagination__list-item__link active">${i}</a></li>
                `)
            } else {
                htmls.push(`
                <li class="pagination__list-item"><a href='${url}?page=${i}' class="pagination__list-item__link">${i}</a></li>
                `)
            }
        }
    }
    if (numberPage > 7 && numberPage - currentPage >= 6) {
        htmls.push(`<li class="pagination__list-item"><a href='${url}?page=${currentPage + 6}' title='Đến trang ${currentPage + 6}' class="pagination__list-item__link">...</a></li>`);
    }
    if (numberPage > 1 && currentPage < numberPage) {
        htmls.push(`<li class="pagination__list-item"><a href='${url}?page=${currentPage + 1}' class="pagination__list-item__link">&#62;</a></li>`);
        htmls.push(`<li class="pagination__list-item"><a href='${url}?page=${numberPage}' class="pagination__list-item__link">End</a></li>`);
    }
    if (numberPage > 7 && currentPage - 1 >= 6) {
        htmls.unshift(`<li class="pagination__list-item"><a href='${url}?page=${currentPage - 6}' title='Đến trang ${currentPage - 6}' class="pagination__list-item__link">...</a></li>`);
    }
    if (numberPage > 1 && currentPage > 1) {
        htmls.unshift(`<li class="pagination__list-item"><a href='${url}?page=${currentPage - 1}' class="pagination__list-item__link">&#60;</a></li>`);
        htmls.unshift(`<li class="pagination__list-item"><a href='${url}?page=${1}' class="pagination__list-item__link">Start</a></li>`);
    }
    paginationList.innerHTML = htmls.join('');
}