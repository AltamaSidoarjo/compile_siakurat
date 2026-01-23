// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

$(document).ready(function () {
    $('.select2').select2({
        theme: 'bootstrap-5',
        width: '100%'
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const dropdownSubmenus = document.querySelectorAll('.dropdown-submenu > a');

    // Tutup semua submenu saat menutup dropdown utama
    const dropdowns = document.querySelectorAll('.dropdown');
    dropdowns.forEach(drop => {
        drop.addEventListener('hide.bs.dropdown', function () {
            const submenus = this.querySelectorAll('.dropdown-menu.show');
            submenus.forEach(sm => sm.classList.remove('show'));
        });
    });
});

function getQueryParam(param) {
    const params = new URLSearchParams(window.location.search);
    const value = params.get(param);
    return value ? parseInt(value) : null;
}