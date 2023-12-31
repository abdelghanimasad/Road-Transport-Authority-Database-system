# Road-Transport-Authority-Database-system

This is a relational database for a transportation authority of a medium-sized city (e.g., RTA of Sharjah).

Analysis:
There are many buses owned by the authority. The buses operate on routes of the transportation network. As a part of the transportation network, a list of bus stops has already been identified. There are several routes in the network where each bus is assigned to exactly one route. On the other hand, there may be multiple buses operating on the same route. A route consists of a sequence of enumerated stops. The first and last of stops of each route are called its terminals. 

Overall, this project simulates a comprehensive database designed to efficiently manage various aspects of a public transportation system. The system encompasses key entities such as routes, buses, passengers, rides, bus drivers, and bus stops, creating a robust framework for organizing, storing, and retrieving information. The database facilitates seamless tracking of bus routes, their associated stops, and the buses operating on these routes. It maintains a detailed record of passengers, their identification, and their corresponding rides, ensuring an integrated approach to public transportation data management. With a focus on scalability and data integrity, the project aims to provide a reliable foundation for the dynamic and evolving requirements of a public transportation network.

Entities:

Route: Represents a specific bus route with information such as route ID, name, number of bus stops, first and last stop.
Bus: Represents information about buses, including license plate number, route name, seat capacity, make, model, model year, and fuel type.
Bus_stop: Represents bus stops with a name and the route it belongs to.
Passenger: Represents passengers with first name, last name, and a unique passenger ID.
Rides: Represents the rides taken by passengers on specific buses, linking passengers and buses through their respective IDs.
Bus_driver: Represents bus drivers with first name, last name, driver ID, phone number, and the license plate number of the bus they drive.

Functionality:

Foreign Keys: Relationships between entities are established using foreign keys, ensuring data integrity.
Data Insertion: Sample data for routes, buses, passengers, rides, bus drivers, and bus stops is inserted into the tables.
Views: A view named ElectricBuses is created to display information about buses with electric fuel types.
Queries: Various SQL queries are used to retrieve information, such as finding routes with the maximum number of bus stops and identifying bus stops shared by at least two routes.

Issues Encountered:

There were foreign key constraint issues in some cases, which required careful handling of data insertion to avoid conflicts.
The project involved resolving errors, ensuring proper data relationships, and querying the database for specific information.
Current Task:
The most recent task involves identifying and fixing a foreign key error in the Bus and Passenger tables to resolve insertion issues.
