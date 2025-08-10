-- Single line comment
/*
Multi-line 
comment
*/

-- ------------------------------------------------------------------ Database Queries ---------------------------------------------------
-- create a dataabse to work on it 
CREATE DATABASE StockMarket;

-- to work on that database use it first 
use StockMarket;

-- ----------------------------------------------------------------- Table Analysis -----------------------------------------------------
/*
Table-1  : Stocks(stock_id, company_name, ticker_symbol, exchange, sector, industry, market_cap, ipo_date, status, remarks)
Table-2  : Investors(investor_id, first_name, last_name, email, phone_number, address, city, country, date_joined, status)
Table-3  : Transactions(transaction_id, stock_id, investor_id, transaction_type, quantity, price, transaction_date, broker_id, status, remarks)
Table-4  : Brokers(broker_id, broker_name, license_number, contact_person, phone_number, email, address, city, country, status)
Table-5  : Dividends(dividend_id, stock_id, declaration_date, ex_dividend_date, payment_date, amount_per_share, currency, status, remarks, approved_by)
Table-6  : MarketIndices(index_id, index_name, exchange, country, base_value, current_value, change_percentage, last_updated, status, remarks)
Table-7  : MutualFunds(fund_id, fund_name, manager, inception_date, nav, category, risk_level, total_assets, status, remarks)
Table-8  : IPOs(ipo_id, company_name, issue_price, issue_size, opening_price, listing_date, exchange, country, status, remarks)
Table-9  : ForexRates(forex_id, currency_pair, base_currency, quote_currency, rate, change_percentage, last_updated, source, status, remarks)
Table-10 : TradingHours(trading_id, exchange, country, open_time, close_time, timezone, pre_market, post_market, status, remarks)

*/

-- ---------------------------------------------------------------- Database Queries -----------------------------------------------------

-- Table-1: Stocks
CREATE TABLE Stocks (
    stock_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    ticker_symbol VARCHAR(10),
    exchange VARCHAR(50),
    sector VARCHAR(50),
    industry VARCHAR(50),
    market_cap BIGINT,
    ipo_date DATE,
    status VARCHAR(20),
    remarks VARCHAR(255)
);

INSERT INTO Stocks VALUES
(101, 'Alpha Corp', 'ALP', 'NYSE', 'Technology', 'Software', 500000000, '2010-06-15', 'Active', 'Leading software provider'),
(102, 'Beta Ltd', 'BET', 'NASDAQ', 'Healthcare', 'Biotech', 300000000, '2015-09-20', 'Active', 'Innovative biotech firm'),
(103, 'Gamma Inc', 'GMM', 'LSE', 'Finance', 'Banking', 750000000, '2005-03-10', 'Active', 'Top UK bank'),
(104, 'Delta PLC', 'DLT', 'ASX', 'Energy', 'Oil & Gas', 600000000, '2012-11-01', 'Inactive', 'Merged in 2020'),
(105, 'Epsilon Co', 'EPS', 'TSX', 'Retail', 'E-commerce', 450000000, '2018-07-30', 'Active', 'Fast growing online retailer');

-- to remove the data of the table 
TRUNCATE TABLE Stocks;

-- to delete the entire table 
DROP TABLE Stocks;

-- Table-2: Investors
CREATE TABLE Investors (
    investor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(50),
    country VARCHAR(50),
    date_joined DATE,
    status VARCHAR(20)
);

INSERT INTO Investors VALUES
(201, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', 'New York', 'USA', '2020-01-15', 'Active'),
(202, 'Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Oak Ave', 'London', 'UK', '2019-05-20', 'Active'),
(203, 'Mike', 'Johnson', 'mike.j@example.com', '5551112233', '789 Pine Rd', 'Toronto', 'Canada', '2021-03-10', 'Inactive'),
(204, 'Emily', 'Brown', 'emily.b@example.com', '4442223344', '321 Birch Blvd', 'Sydney', 'Australia', '2018-07-05', 'Active'),
(205, 'David', 'Wilson', 'david.w@example.com', '6663334455', '654 Cedar Ln', 'Auckland', 'New Zealand', '2022-09-25', 'Active');

-- to remove the data of the table 
TRUNCATE TABLE Investors;

-- to delete the entire table 
DROP TABLE Investors;

-- Table-3: Transactions
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    stock_id INT,
    investor_id INT,
    transaction_type VARCHAR(20),
    quantity INT,
    price DECIMAL(10,2),
    transaction_date DATE,
    broker_id INT,
    status VARCHAR(20),
    remarks VARCHAR(255)
);

INSERT INTO Transactions VALUES
(301, 101, 201, 'Buy', 100, 50.75, '2023-01-10', 401, 'Completed', 'First purchase'),
(302, 102, 202, 'Sell', 50, 75.20, '2023-02-15', 402, 'Completed', 'Profit booking'),
(303, 103, 203, 'Buy', 200, 30.10, '2023-03-12', 403, 'Pending', 'Awaiting funds'),
(304, 104, 204, 'Sell', 80, 55.00, '2023-04-20', 404, 'Completed', 'Sold after merger'),
(305, 105, 205, 'Buy', 150, 40.50, '2023-05-25', 405, 'Completed', 'Long-term holding');

-- to remove the data of the table 
TRUNCATE TABLE Transactions;

-- to delete the entire table 
DROP TABLE Transactions;

-- Table-4: Brokers
CREATE TABLE Brokers (
    broker_id INT PRIMARY KEY,
    broker_name VARCHAR(100),
    license_number VARCHAR(50),
    contact_person VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(50),
    country VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO Brokers VALUES
(401, 'Prime Brokers', 'LIC12345', 'Alice Johnson', '9998887777', 'alice.j@prime.com', '100 Broker St', 'New York', 'USA', 'Active'),
(402, 'Elite Trading', 'LIC67890', 'Bob Smith', '8887776666', 'bob.s@elite.com', '200 Trade Ave', 'London', 'UK', 'Active'),
(403, 'Global Investments', 'LIC54321', 'Charlie Davis', '7776665555', 'charlie.d@global.com', '300 Invest Rd', 'Toronto', 'Canada', 'Active'),
(404, 'Apex Securities', 'LIC98765', 'Diana White', '6665554444', 'diana.w@apex.com', '400 Secure Blvd', 'Sydney', 'Australia', 'Inactive'),
(405, 'Summit Capital', 'LIC19283', 'Edward Green', '5554443333', 'edward.g@summit.com', '500 Capital Ln', 'Auckland', 'New Zealand', 'Active');

-- to remove the data of the table 
TRUNCATE TABLE Brokers;

-- to delete the entire table 
DROP TABLE Brokers;

-- Table-5: Dividends
CREATE TABLE Dividends (
    dividend_id INT PRIMARY KEY,
    stock_id INT,
    declaration_date DATE,
    ex_dividend_date DATE,
    payment_date DATE,
    amount_per_share DECIMAL(10,2),
    currency VARCHAR(10),
    status VARCHAR(20),
    remarks VARCHAR(255),
    approved_by VARCHAR(50)
);

INSERT INTO Dividends VALUES
(501, 101, '2023-01-05', '2023-01-20', '2023-02-01', 1.50, 'USD', 'Paid', 'Annual dividend', 'Board A'),
(502, 102, '2023-02-10', '2023-02-25', '2023-03-05', 2.00, 'USD', 'Paid', 'Special dividend', 'Board B'),
(503, 103, '2023-03-15', '2023-03-30', '2023-04-10', 1.20, 'GBP', 'Pending', 'Quarterly dividend', 'Board C'),
(504, 104, '2023-04-20', '2023-05-05', '2023-05-15', 1.80, 'AUD', 'Cancelled', 'Merger impact', 'Board D'),
(505, 105, '2023-05-25', '2023-06-10', '2023-06-20', 2.50, 'CAD', 'Paid', 'Annual dividend', 'Board E');

-- to remove the data of the table 
TRUNCATE TABLE Dividends;

-- to delete the entire table 
DROP TABLE Dividends;


-- Table-6: MarketIndices
CREATE TABLE MarketIndices (
    index_id INT PRIMARY KEY,
    index_name VARCHAR(100),
    exchange VARCHAR(50),
    country VARCHAR(50),
    total_companies INT,
    market_cap BIGINT,
    launch_date DATE,
    status VARCHAR(20),
    remarks VARCHAR(255),
    updated_by VARCHAR(50)
);

INSERT INTO MarketIndices VALUES
(601, 'S&P 500', 'NYSE', 'USA', 500, 38000000000000, '1957-03-04', 'Active', 'Tracks top 500 US companies', 'Admin1'),
(602, 'FTSE 100', 'LSE', 'UK', 100, 3000000000000, '1984-01-03', 'Active', 'Tracks top 100 UK companies', 'Admin2'),
(603, 'Nikkei 225', 'TSE', 'Japan', 225, 5000000000000, '1950-09-07', 'Active', 'Tracks 225 top Japanese companies', 'Admin3'),
(604, 'ASX 200', 'ASX', 'Australia', 200, 2000000000000, '2000-03-31', 'Active', 'Tracks 200 largest Australian companies', 'Admin4'),
(605, 'TSX Composite', 'TSX', 'Canada', 250, 3000000000000, '1977-01-01', 'Inactive', 'Under review', 'Admin5');

-- to remove the data of the table 
TRUNCATE TABLE MarketIndices;

-- to delete the entire table 
DROP TABLE MarketIndices;

-- Table-7: Analysts
CREATE TABLE Analysts (
    analyst_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    firm VARCHAR(100),
    specialization VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    rating DECIMAL(3,2),
    country VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO Analysts VALUES
(701, 'Mark', 'Taylor', 'Global Analytics', 'Equity', '1112223333', 'mark.t@ga.com', 4.8, 'USA', 'Active'),
(702, 'Sarah', 'Lee', 'Market Insights', 'Commodities', '2223334444', 'sarah.l@mi.com', 4.5, 'UK', 'Active'),
(703, 'Tom', 'Anderson', 'Finance Vision', 'Forex', '3334445555', 'tom.a@fv.com', 4.2, 'Canada', 'Inactive'),
(704, 'Lisa', 'Brown', 'Economic Edge', 'Bonds', '4445556666', 'lisa.b@ee.com', 4.7, 'Australia', 'Active'),
(705, 'James', 'White', 'TradeXpert', 'Derivatives', '5556667777', 'james.w@tx.com', 4.6, 'New Zealand', 'Active');

-- to remove the data of the table 
TRUNCATE TABLE Analysts;

-- to delete the entire table 
DROP TABLE Analysts;

-- Table-8: Watchlists
CREATE TABLE Watchlists (
    watchlist_id INT PRIMARY KEY,
    investor_id INT,
    stock_id INT,
    date_added DATE,
    alert_price DECIMAL(10,2),
    notes VARCHAR(255),
    priority_level VARCHAR(20),
    created_by VARCHAR(50),
    updated_by VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO Watchlists VALUES
(801, 201, 101, '2023-01-10', 55.00, 'Potential breakout', 'High', 'System', 'Admin1', 'Active'),
(802, 202, 102, '2023-02-12', 80.00, 'Sell at resistance', 'Medium', 'System', 'Admin2', 'Active'),
(803, 203, 103, '2023-03-15', 35.00, 'Long-term buy zone', 'Low', 'System', 'Admin3', 'Inactive'),
(804, 204, 104, '2023-04-18', 60.00, 'Post-merger monitoring', 'High', 'System', 'Admin4', 'Active'),
(805, 205, 105, '2023-05-20', 45.00, 'Short-term swing', 'Medium', 'System', 'Admin5', 'Active');

-- to remove the data of the table 
TRUNCATE TABLE Watchlists;

-- to delete the entire table 
DROP TABLE Watchlists;

-- Table-9: Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    investor_id INT,
    stock_id INT,
    order_type VARCHAR(20),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    broker_id INT,
    status VARCHAR(20),
    remarks VARCHAR(255)
);

INSERT INTO Orders VALUES
(901, 201, 101, 'Market Buy', 100, 52.00, '2023-01-11', 401, 'Executed', 'Immediate execution'),
(902, 202, 102, 'Limit Sell', 50, 78.00, '2023-02-14', 402, 'Pending', 'Awaiting target price'),
(903, 203, 103, 'Stop Loss', 200, 28.50, '2023-03-17', 403, 'Executed', 'Triggered stop loss'),
(904, 204, 104, 'Market Sell', 80, 54.00, '2023-04-21', 404, 'Executed', 'Sold after bad earnings'),
(905, 205, 105, 'Limit Buy', 150, 42.00, '2023-05-23', 405, 'Cancelled', 'Order withdrawn');

-- to remove the data of the table 
TRUNCATE TABLE Orders;

-- to delete the entire table 
DROP TABLE Orders;

-- Table-10: Alerts
CREATE TABLE Alerts (
    alert_id INT PRIMARY KEY,
    investor_id INT,
    stock_id INT,
    alert_type VARCHAR(50),
    threshold_value DECIMAL(10,2),
    message VARCHAR(255),
    date_created DATE,
    created_by VARCHAR(50),
    status VARCHAR(20),
    remarks VARCHAR(255)
);

INSERT INTO Alerts VALUES
(1001, 201, 101, 'Price Above', 60.00, 'Stock crossed $60', '2023-01-12', 'System', 'Active', 'Trigger email alert'),
(1002, 202, 102, 'Price Below', 70.00, 'Stock fell below $70', '2023-02-16', 'System', 'Active', 'Trigger SMS alert'),
(1003, 203, 103, 'Volume Spike', 1000000, 'Unusual trading volume', '2023-03-19', 'System', 'Inactive', 'Review market data'),
(1004, 204, 104, 'News Alert', 0.00, 'Merger news released', '2023-04-22', 'System', 'Active', 'Push notification'),
(1005, 205, 105, 'Dividend Declared', 1.50, 'Dividend announced', '2023-05-24', 'System', 'Active', 'Send investor email');

-- to remove the data of the table 
TRUNCATE TABLE Alerts;

-- to delete the entire table 
DROP TABLE Alerts;
