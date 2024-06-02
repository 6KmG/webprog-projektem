class FuelView {
    constructor() {
        this.distanceInput = document.getElementById('distance');
        this.consumptionInput = document.getElementById('consumption');
        this.fuelPriceInput = document.getElementById('fuelPrice');
        this.calculateButton = document.querySelector('input[type="submit"]');
        this.resultDisplay = document.getElementById('result'); // Result display element inside the result box
        this.resultBox = document.querySelector('.result-box'); // Result box element

        // Bind the handleFormSubmit method to the instance
        this.handleFormSubmit = this.handleFormSubmit.bind(this);
        
        // Bind the calculate method to form submission
        this.calculateButton.addEventListener('click', this.handleFormSubmit);
    }

    handleFormSubmit(event) {
        event.preventDefault(); // Prevent the default form submission behavior
        
        const distance = parseFloat(this.distanceInput.value);
        const consumption = parseFloat(this.consumptionInput.value);
        const fuelPrice = parseFloat(this.fuelPriceInput.value);

        // Check if any of the inputs are invalid
        if (isNaN(distance) || isNaN(consumption) || isNaN(fuelPrice)) {
            alert("Please enter valid values for all fields.");
            return;
        }

        // If all inputs are valid, call the handler with the form data
        this.calculateHandler({ distance, consumption, fuelPrice });
    }

    bindCalculate(handler) {
        this.calculateHandler = handler; // Store the handler
    }

    displayResult(result) {
        this.resultDisplay.innerHTML = `<p>Total fuel cost: $${result.toFixed(2)}</p>`;
        this.resultBox.style.display = 'block'; // Display the result box
    }

    getFormData() {
        const distance = parseFloat(this.distanceInput.value);
        const consumption = parseFloat(this.consumptionInput.value);
        const fuelPrice = parseFloat(this.fuelPriceInput.value);
        return { distance, consumption, fuelPrice };
    }
}
