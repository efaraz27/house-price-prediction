from typing import Union

from fastapi import FastAPI, HTTPException
import pickle
import pandas as pd
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Union
import pickle
import pandas as pd
from fastapi.middleware.cors import CORSMiddleware

# Load the model
model = pickle.load(open("./models/XGBoost Regressor.pkl", "rb"))

# Define the supported cities
supported_cities = ["Mumbai", "Bangalore", "Chennai", "Hyderabad", "Kolkata", "Delhi"]

# Define the lat long of the cities
lat_long = {
    "Mumbai": (19.0760, 72.8777),
    "Bangalore": (12.9716, 77.5946),
    "Chennai": (13.0827, 80.2707),
    "Hyderabad": (17.3850, 78.4867),
    "Kolkata": (22.5726, 88.3639),
    "Delhi": (28.7041, 77.1025),
}


app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}


# Load the model
model = pickle.load(open("./models/XGBoost Regressor.pkl", "rb"))

# Define the supported cities
supported_cities = ["Mumbai", "Bangalore", "Chennai", "Hyderabad", "Kolkata", "Delhi"]

# Define the lat long of the cities
lat_long = {
    "Mumbai": (19.0760, 72.8777),
    "Bangalore": (12.9716, 77.5946),
    "Chennai": (13.0827, 80.2707),
    "Hyderabad": (17.3850, 78.4867),
    "Kolkata": (22.5726, 88.3639),
    "Delhi": (28.7041, 77.1025),
}

app = FastAPI()

class HousePredictionRequest(BaseModel):
    area: int
    no_of_bedrooms: int
    maintenance_staff: bool
    security: bool
    city: str

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.post("/predict")
def predict(request: HousePredictionRequest):

    # Validate the input
    # 1. area should be greater than 0
    # 2. no_of_bedrooms should be greater than 0
    # 3. city should be one of the cities in the dataset
    # 4. maintenance_staff and security should be boolean
    # 5. city should be one of the cities in the dataset + convert to lat long
    if request.area <= 0:
        raise HTTPException(status_code=400, detail="Area should be greater than 0")
    if request.no_of_bedrooms <= 0:
        raise HTTPException(status_code=400, detail="No of bedrooms should be greater than 0")
    if request.city not in supported_cities:
        raise HTTPException(status_code=400, detail="City should be one of the supported cities")
    if not isinstance(request.maintenance_staff, bool):
        raise HTTPException(status_code=400, detail="Maintenance staff should be boolean")
    if not isinstance(request.security, bool):
        raise HTTPException(status_code=400, detail="Security should be boolean")
    
    # Convert city to lat long
    city_lat = lat_long[request.city][0]
    city_long = lat_long[request.city][1]

    # Convert maintenance_staff and security to int
    maintenance_staff_int = 1 if request.maintenance_staff else 0
    security_int = 1 if request.security else 0

    data = pd.DataFrame([[request.area, request.no_of_bedrooms, maintenance_staff_int, security_int, city_lat, city_long]], columns=['Area', 'No. of Bedrooms', 'MaintenanceStaff', '24X7Security', 'Latitude', 'Longitude'])

    prediction = model.predict(data)[0]*100000

    # round to 2 decimal places
    prediction = round(prediction, 2)
    
    return {"prediction": prediction}



origins = ["*"]    
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    expose_headers=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)