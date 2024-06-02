class View {
    /**
     * Elrejti a bemeneti mezőket.
     */
    static showInput() {
        document.querySelector('.collection').style.display = 'none';
    }

    /**
     * Regisztrálja az eseménykezelőt a kalkuláció gombra kattintásra.
     * @param {Function} method - A kalkuláció metódus.
     */
    static onSubmit(method) {
        document.querySelector("form button").onclick = function (evt) {
            evt.preventDefault();
            method();
        }
    }

    /**
     * Megjeleníti az eredményt.
     * @param {number} amount - Szükséges üzemanyag mennyisége (literben).
     * @param {number} total - Tankolás várható költsége (HUF).
     */
    static showResult(amount, total) {
        document.querySelector('.amount').innerHTML = `${amount} liter`;
        document.querySelector('.total').innerHTML = `${total} HUF`;
        document.querySelector('.collection').style.display = 'block';
    }

    /**
     * Elrejti az eredményt.
     */
    static hideResult() {
        document.querySelector('.collection').style.display = 'none';
    }
}
