require 'rails_helper'

describe CarsController do
  describe '#create' do
    # best case:
    it 'saves a car object to the database' do
      cars_before = Car.count
      post :create, params: { car: { make: 'Subaru', model: 'Outback', year: '2018' } }
      cars_after = Car.count

      # expect that there is 1 more car in the db than before
      expect(cars_after).to eq(cars_before + 1)

      # look at the last car and see that it matches what we created
      last_car = Car.last
      expect(last_car.make).to eq('Subaru')
      expect(last_car.model).to eq('Outback')
    end

    it 'does not save if given a year in the future' do
      cars_before = Car.count
      post :create, params: { car: { make: 'Subaru', model: 'Outback', year: '2023' } }
      cars_after = Car.count

      # expect that the number of cars does not change
      expect(cars_after).to eq(cars_before)
    end
  end
end
