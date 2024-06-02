class Model {
    /**
     * Számolja ki az üzemanyag mennyiségét.
     * @param {number} dist - Távolság (km).
     * @param {number} avg - Átlagfogyasztás (L/100km).
     * @returns {number} - Szükséges üzemanyag mennyisége (literben).
     */
    getAmount(dist, avg) {
        return parseInt(dist * avg) / 100;
    }

    /**
     * Számolja ki a tankolás várható költségét.
     * @param {number} amount - Szükséges üzemanyag mennyisége (literben).
     * @param {number} price - Üzemanyagár (HUF/L).
     * @returns {number} - Tankolás várható költsége (HUF).
     */
    getTotal(amount, price) {
        return parseInt(amount * price);
    }
}
