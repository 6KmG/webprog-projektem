class FuelController {
    constructor(model, view) {
        this.model = model;
        this.view = view;

        // Bind the handleCalculate method to the instance
        this.handleCalculate = this.handleCalculate.bind(this);
        
        // Call the bindCalculate method of the view to set up event handling
        this.view.bindCalculate(this.handleCalculate);
    }

    // Handle the calculation
    handleCalculate() {
        const formData = this.view.getFormData(); // Ensure we're correctly referencing 'this.view'
        const { distance, consumption, fuelPrice } = formData;
        this.model.setDistance(distance);
        this.model.setConsumption(consumption);
        this.model.setFuelPrice(fuelPrice);

        const result = this.model.calculateFuelCost();
        this.view.displayResult(result);
    }
}

// Initialize the application
const model = new FuelModel();
const view = new FuelView();
const controller = new FuelController(model, view);