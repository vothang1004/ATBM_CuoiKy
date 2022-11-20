// handle sidebar item 3
const item3 = document.querySelector('.sidebar__list .sidebar__item:nth-child(3)');
const icon3 = document.querySelector('.sidebar__list .sidebar__item:nth-child(3) i');
const item4 = document.querySelector('.sidebar__list .sidebar__item:nth-child(4)');
let isShow3 = false;
let isRotate3 = false;
function showSideBarItemList3() {
    if(!isShow3) {
        item4.style = `display: block`;
        isShow3 = true;
    }
    else{
        item4.style = `display: none`;
        isShow3 = false;
    }
}
function rotateIcon3() {
    if(!isRotate3) {
        icon3.style = `transform: rotateZ(-45deg);`;
        isRotate3 = true;
    }else {
        icon3.style = `transform: rotateZ(90deg);`;
        isRotate3 = false;
    }
}
item3.onclick = function() {
    rotateIcon3();
    showSideBarItemList3();
}
// handle sidebar item 5
const item5 = document.querySelector('.sidebar__list .sidebar__item:nth-child(5)');
const icon5 = document.querySelector('.sidebar__list .sidebar__item:nth-child(5) i');
const item6 = document.querySelector('.sidebar__list .sidebar__item:nth-child(6)');
let isShow5 = false;
let isRotate5 = false;
function showSideBarItemList5() {
    if(!isShow5) {
        item6.style = `display: block`;
        isShow5 = true;
    }
    else{
        item6.style = `display: none`;
        isShow5 = false;
    }
}
function rotateIcon5() {
    if(!isRotate5) {
        icon5.style = `transform: rotateZ(-45deg);`;
        isRotate5 = true;
    }else {
        icon5.style = `transform: rotateZ(90deg);`;
        isRotate5 = false;
    }
}
item5.onclick = function() {
    rotateIcon5();
    showSideBarItemList5();
}
//*************** */ handle show submenu
const listItem1 = document.querySelector('.sidebar__item-list .sidebar__item-listitem:nth-child(1)'); 
const subMenu1 = document.querySelector('.sidebar__item-list .sidebar__item-listitem:nth-child(2)');
const listItem3 = document.querySelector('.sidebar__item-list .sidebar__item-listitem:nth-child(3)'); 
const subMenu3 = document.querySelector('.sidebar__item-list .sidebar__item-listitem:nth-child(4)');
const listItem5 = document.querySelector('.sidebar__item-list .sidebar__item-listitem:nth-child(5)'); 
const subMenu5 = document.querySelector('.sidebar__item-list .sidebar__item-listitem:nth-child(6)');
const listItem7 = document.querySelector('.sidebar__item-list .sidebar__item-listitem:nth-child(7)'); 
const subMenu7 = document.querySelector('.sidebar__item-list .sidebar__item-listitem:nth-child(8)');
const listIconSubMenu = document.querySelectorAll('.sidebar__item-listitem-icon');

function showSubMenu(subMenu) {
    if(subMenu.classList.contains('item-hide')) {
        subMenu.classList.remove('item-hide');
    }else {
        subMenu.classList.add('item-hide');
    }
}
function rotateIconSubMenu(icon) {
    if(!icon.style.transform) {
        icon.style = `transform: rotateZ(-45deg)`;
    }
    else {
        icon.style = `transform: rotateZ(90deg)`;
        icon.style.transform = '';
    }
}
listItem1.onclick = () => {
    rotateIconSubMenu(listIconSubMenu[0]);
    showSubMenu(subMenu1);
};
listItem3.onclick = () => {
    rotateIconSubMenu(listIconSubMenu[1]);
    showSubMenu(subMenu3);
};
listItem5.onclick = () => {
    rotateIconSubMenu(listIconSubMenu[2]);
    showSubMenu(subMenu5);
};
listItem7.onclick = () => {
    rotateIconSubMenu(listIconSubMenu[3]);
    showSubMenu(subMenu7);
};

