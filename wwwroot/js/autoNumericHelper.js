// Map untuk menyimpan instance AutoNumeric
const autoNumericInstances = new Map();

/**
 * Inisialisasi AutoNumeric untuk elemen berdasarkan selector CSS.
 * @param {string} selector - Selector elemen (misalnya '.input-field-pembayaran').
 * @param {object} options - Opsi konfigurasi AutoNumeric.
 */
function initializeAutoNumericBySelector(selector, options = {}) {
    document.querySelectorAll(selector).forEach(el => {
        if (!el.classList.contains('autonumeric-initialized')) {
            const an = new AutoNumeric(el, options);
            autoNumericInstances.set(el, an);
            el.classList.add('autonumeric-initialized');
        }
    });
}

/**
 * Inisialisasi AutoNumeric untuk satu elemen spesifik berdasarkan ID atau DOM element.
 * @param {string|HTMLElement} elementOrId - ID string atau DOM element langsung.
 * @param {object} options - Opsi konfigurasi AutoNumeric.
 */
function initializeAutoNumericSingle(elementOrId, options = {}) {
    const el = typeof elementOrId === 'string'
        ? document.getElementById(elementOrId)
        : elementOrId;

    if (el && !el.classList.contains('autonumeric-initialized')) {
        const an = new AutoNumeric(el, options);
        autoNumericInstances.set(el, an);
        el.classList.add('autonumeric-initialized');
    }
}

/**
 * Mendapatkan nilai numerik mentah dari elemen AutoNumeric (jika sudah diinisialisasi).
 * @param {HTMLElement} el - Element input target.
 * @returns {number} - Nilai numerik (tanpa format).
 */
function getAutoNumericRawValue(el) {
    const instance = autoNumericInstances.get(el);
    if (instance) {
        return instance.getNumber();
    }
    return parseFloat(el.value.replace(/\./g, '').replace(',', '.')) || 0;
}

/**
 * Mengatur nilai numerik terformat ke dalam elemen AutoNumeric.
 * @param {HTMLElement} el - Element input target.
 * @param {number|string} value - Nilai numerik.
 */
function setAutoNumericValue(el, value) {
    const instance = autoNumericInstances.get(el);
    if (instance) {
        instance.set(value);
    } else {
        el.value = value;
    }
}