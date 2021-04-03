x<-1:400
y<-sin(x/10)*exp(x*-0.01)
plot(x,y)

# Create and look at new crime_data object
crime_data <- read.csv("data/mps-recordedcrime-borough.csv",
stringsAsFactors = FALSE)
head(crime_data$CrimeType) # information about crime type
# Extract "Theft & Handling" crimes and save
crime_theft <- crime_data[crime_data$CrimeType == "Theft & Handling", ]
head(crime_theft, 2) # take a look at the result (replace 2 with 10 to see more rows)
# Calculate the sum of the crime count for each district, save result
crime_ag <- aggregate(CrimeCount ~ Borough, FUN = sum, data = crime_theft)
# Show the first two rows of the aggregated crime data
head(crime_ag, 2)

# stations = read_shape("data/lnd-stns.shp") # from tmap
proj4string(stations) # this is the full geographical detail.
proj4string(lnd) # what's the coordinate reference system (CRS)