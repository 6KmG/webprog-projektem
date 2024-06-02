class FuelModel {
    constructor() {
        this.distance = 0;
        this.consumption = 0;
        this.fuelPrice = 0;
    }

    setDistance(distance) {
        this.distance = distance;
    }

    setConsumption(consumption) {
        this.consumption = consumption;
    }

    setFuelPrice(fuelPrice) {
        this.fuelPrice = fuelPrice;
    }

    calculateFuelCost() {
        return (this.distance / 100) * this.consumption * this.fuelPrice;
    }
}
