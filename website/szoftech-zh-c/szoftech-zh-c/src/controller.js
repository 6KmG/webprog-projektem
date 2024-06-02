class Controller {
    // Privát statikus mező a Model példány tárolására
    static #model;

    // Alkalmazás inicializálása
    static AppInit() {
        // Model példány létrehozása
        this.#model = new Model();

        // Nézet inicializálása
        View.showInput();
        View.onSubmit(() => {
            let distance = parseInt(document.getElementById('distance').value);
            let avg = parseFloat(document.getElementById('avg').value);
            let price = parseInt(document.getElementById('price').value);
            let amount = this.#model.getAmount(distance, avg);
            if (distance && avg && price && distance > 0 && avg > 0 && price > 0) {
                View.showResult(amount, this.#model.getTotal(amount, price));
            }
            else {
                View.hideResult();
            }
        });
    }
}
    