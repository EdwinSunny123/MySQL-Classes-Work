-- Single line comment
/*
Multi-line 
comment
*/

-- ------------------------------------------------------------------ Database Queries ---------------------------------------------------
-- create a dataabse to work on it 
CREATE DATABASE CryptoCurrency;

-- to work on that database use it first 
use CryptoCurrency;

-- ----------------------------------------------------------------- Table Analysis -----------------------------------------------------
/*
Table-1  : Users(user_id, username, email, password_hash, full_name, phone_number, country, created_at, status, kyc_verified)
Table-2  : Wallets(wallet_id, user_id, wallet_address, currency_code, balance, created_at, updated_at, status, wallet_type, remarks)
Table-3  : Cryptocurrencies(currency_code, name, symbol, market_cap, circulating_supply, max_supply, launch_date, consensus_mechanism, founder, status)
Table-4  : Transactions(transaction_id, wallet_id, currency_code, amount, transaction_type, transaction_date, status, fee, from_address, to_address)
Table-5  : Exchanges(exchange_id, name, country, founded_year, ceo, volume_24h, supported_currencies, website, status, remarks)
Table-6  : Market_Prices(price_id, currency_code, price_usd, price_btc, market_cap, volume_24h, high_24h, low_24h, price_date, status)
Table-7  : ICOs(ico_id, project_name, start_date, end_date, raised_amount, token_price, currency_code, status, founder, remarks)
Table-8  : Mining_Operations(operation_id, currency_code, location, start_date, hash_rate, energy_consumption, pool_name, status, operator, remarks)
Table-9  : Security_Logs(log_id, user_id, action, ip_address, device, location, timestamp, status, severity, remarks)
Table-10 : Support_Tickets(ticket_id, user_id, subject, description, created_at, resolved_at, status, priority, assigned_to, remarks)


*/

-- ---------------------------------------------------------------- Database Queries -----------------------------------------------------

-- Table-1: Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    password_hash VARCHAR(255),
    full_name VARCHAR(100),
    phone_number VARCHAR(20),
    country VARCHAR(50),
    created_at DATE,
    status VARCHAR(20),
    kyc_verified BOOLEAN
);

INSERT INTO Users VALUES
(101, 'cryptoKing', 'king@example.com', 'hash1', 'John Doe', '+1234567890', 'USA', '2023-01-10', 'active', TRUE),
(102, 'blockQueen', 'queen@example.com', 'hash2', 'Jane Smith', '+1987654321', 'UK', '2023-02-15', 'active', TRUE),
(103, 'minerJoe', 'joe@example.com', 'hash3', 'Joe Miner', '+1122334455', 'Canada', '2023-03-20', 'inactive', FALSE),
(104, 'tokenTina', 'tina@example.com', 'hash4', 'Tina Token', '+2211334455', 'Australia', '2023-04-25', 'active', TRUE),
(105, 'chainCharlie', 'charlie@example.com', 'hash5', 'Charlie Chain', '+9988776655', 'Germany', '2023-05-30', 'active', FALSE);

-- to remove the data of the table 
TRUNCATE TABLE Users;

-- to delete the entire table 
DROP TABLE Users;


-- Table-2: Wallets
CREATE TABLE Wallets (
    wallet_id INT PRIMARY KEY,
    user_id INT,
    wallet_address VARCHAR(100),
    currency_code VARCHAR(10),
    balance DECIMAL(18,8),
    created_at DATE,
    updated_at DATE,
    status VARCHAR(20),
    wallet_type VARCHAR(20),
    remarks VARCHAR(255)
);

INSERT INTO Wallets VALUES
(201, 101, 'addr101', 'BTC', 2.34567890, '2023-01-12', '2023-06-01', 'active', 'hot', 'Main BTC wallet'),
(202, 102, 'addr102', 'ETH', 5.12345678, '2023-02-18', '2023-06-05', 'active', 'cold', 'ETH investment'),
(203, 103, 'addr103', 'BTC', 0.56789012, '2023-03-25', '2023-06-10', 'inactive', 'hot', 'Old BTC wallet'),
(204, 104, 'addr104', 'ADA', 1500.00000000, '2023-04-30', '2023-06-15', 'active', 'cold', 'ADA staking wallet'),
(205, 105, 'addr105', 'SOL', 800.50000000, '2023-05-05', '2023-06-20', 'active', 'hot', 'Trading wallet');

-- to remove the data of the table 
TRUNCATE TABLE Wallets;

-- to delete the entire table 
DROP TABLE Wallets;


-- Table-3: Cryptocurrencies
CREATE TABLE Cryptocurrencies (
    currency_code VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    symbol VARCHAR(10),
    market_cap DECIMAL(18,2),
    circulating_supply DECIMAL(18,2),
    max_supply DECIMAL(18,2),
    launch_date DATE,
    consensus_mechanism VARCHAR(50),
    founder VARCHAR(100),
    status VARCHAR(20)
);

INSERT INTO Cryptocurrencies VALUES
('BTC', 'Bitcoin', 'BTC', 600000000000, 19000000, 21000000, '2009-01-03', 'Proof of Work', 'Satoshi Nakamoto', 'active'),
('ETH', 'Ethereum', 'ETH', 250000000000, 120000000, NULL, '2015-07-30', 'Proof of Stake', 'Vitalik Buterin', 'active'),
('ADA', 'Cardano', 'ADA', 40000000000, 35000000000, 45000000000, '2017-09-29', 'Proof of Stake', 'Charles Hoskinson', 'active'),
('SOL', 'Solana', 'SOL', 20000000000, 350000000, NULL, '2020-03-20', 'Proof of History', 'Anatoly Yakovenko', 'active'),
('DOGE', 'Dogecoin', 'DOGE', 9000000000, 130000000000, NULL, '2013-12-06', 'Proof of Work', 'Billy Markus', 'active');

-- to remove the data of the table 
TRUNCATE TABLE Cryptocurrencies;

-- to delete the entire table 
DROP TABLE Cryptocurrencies;


-- Table-4: Transactions
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    wallet_id INT,
    currency_code VARCHAR(10),
    amount DECIMAL(18,8),
    transaction_type VARCHAR(20),
    transaction_date DATE,
    status VARCHAR(20),
    fee DECIMAL(18,8),
    from_address VARCHAR(100),
    to_address VARCHAR(100)
);

INSERT INTO Transactions VALUES
(301, 201, 'BTC', 0.50000000, 'send', '2023-06-01', 'completed', 0.00050000, 'addr101', 'addrX1'),
(302, 202, 'ETH', 1.25000000, 'receive', '2023-06-03', 'completed', 0.00020000, 'addrY1', 'addr102'),
(303, 203, 'BTC', 0.10000000, 'send', '2023-06-05', 'pending', 0.00010000, 'addr103', 'addrZ1'),
(304, 204, 'ADA', 300.00000000, 'receive', '2023-06-07', 'completed', 0.05000000, 'addrW1', 'addr104'),
(305, 205, 'SOL', 150.00000000, 'send', '2023-06-09', 'failed', 0.02000000, 'addr105', 'addrV1');

-- to remove the data of the table 
TRUNCATE TABLE Transactions;

-- to delete the entire table 
DROP TABLE Transactions;


-- Table-5: Exchanges
CREATE TABLE Exchanges (
    exchange_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50),
    founded_year INT,
    ceo VARCHAR(100),
    volume_24h DECIMAL(18,2),
    supported_currencies INT,
    website VARCHAR(100),
    status VARCHAR(20),
    remarks VARCHAR(255)
);

INSERT INTO Exchanges VALUES
(401, 'Binance', 'Cayman Islands', 2017, 'Changpeng Zhao', 76000000000, 350, 'https://www.binance.com', 'active', 'World largest exchange'),
(402, 'Coinbase', 'USA', 2012, 'Brian Armstrong', 2500000000, 200, 'https://www.coinbase.com', 'active', 'Popular in USA'),
(403, 'Kraken', 'USA', 2011, 'Jesse Powell', 1000000000, 150, 'https://www.kraken.com', 'active', 'High security focus'),
(404, 'KuCoin', 'Seychelles', 2017, 'Johnny Lyu', 1500000000, 300, 'https://www.kucoin.com', 'active', 'Wide range of coins'),
(405, 'Bitfinex', 'Hong Kong', 2012, 'Jean-Louis van der Velde', 800000000, 180, 'https://www.bitfinex.com', 'active', 'Liquidity provider');

-- to remove the data of the table 
TRUNCATE TABLE Exchanges;

-- to delete the entire table 
DROP TABLE Exchanges;


-- Table-6: Market_Prices
CREATE TABLE Market_Prices (
    price_id INT PRIMARY KEY,
    currency_code VARCHAR(10),
    price_usd DECIMAL(18,8),
    price_btc DECIMAL(18,8),
    market_cap DECIMAL(18,2),
    volume_24h DECIMAL(18,2),
    high_24h DECIMAL(18,8),
    low_24h DECIMAL(18,8),
    price_date DATE,
    status VARCHAR(20)
);

INSERT INTO Market_Prices VALUES
(501, 'BTC', 30000.00000000, 1.00000000, 600000000000, 35000000000, 31000.00000000, 29500.00000000, '2023-06-10', 'active'),
(502, 'ETH', 2000.00000000, 0.06600000, 250000000000, 15000000000, 2050.00000000, 1950.00000000, '2023-06-10', 'active'),
(503, 'ADA', 0.40000000, 0.00001333, 14000000000, 500000000, 0.42000000, 0.39000000, '2023-06-10', 'active'),
(504, 'SOL', 20.00000000, 0.00066600, 8000000000, 300000000, 21.00000000, 19.50000000, '2023-06-10', 'active'),
(505, 'DOGE', 0.07000000, 0.00000233, 9000000000, 200000000, 0.07200000, 0.06800000, '2023-06-10', 'active');

-- to remove the data of the table 
TRUNCATE TABLE Market_Prices;

-- to delete the entire table 
DROP TABLE Market_Prices;


-- Table-7: ICOs
CREATE TABLE ICOs (
    ico_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    raised_amount DECIMAL(18,2),
    token_price DECIMAL(18,8),
    currency_code VARCHAR(10),
    status VARCHAR(20),
    founder VARCHAR(100),
    remarks VARCHAR(255)
);

INSERT INTO ICOs VALUES
(601, 'CryptoProjectX', '2022-01-01', '2022-03-01', 5000000, 0.05000000, 'ETH', 'completed', 'Alice Johnson', 'Successful ICO'),
(602, 'MetaChain', '2022-05-01', '2022-07-01', 8000000, 0.10000000, 'BTC', 'completed', 'Bob Williams', 'Overfunded'),
(603, 'DeFiBoost', '2022-09-01', '2022-11-01', 3000000, 0.02000000, 'ETH', 'failed', 'Carol Smith', 'Low participation'),
(604, 'NFTVerse', '2023-01-01', '2023-03-01', 10000000, 0.15000000, 'SOL', 'completed', 'David Lee', 'NFT-based project'),
(605, 'GreenCoin', '2023-04-01', '2023-06-01', 7000000, 0.07000000, 'ADA', 'ongoing', 'Eve Kim', 'Eco-friendly crypto');

-- to remove the data of the table 
TRUNCATE TABLE ICOs;

-- to delete the entire table 
DROP TABLE ICOs;


-- Table-8: Mining_Operations
CREATE TABLE Mining_Operations (
    operation_id INT PRIMARY KEY,
    currency_code VARCHAR(10),
    location VARCHAR(100),
    start_date DATE,
    hash_rate DECIMAL(18,2),
    energy_consumption DECIMAL(18,2),
    pool_name VARCHAR(100),
    status VARCHAR(20),
    operator VARCHAR(100),
    remarks VARCHAR(255)
);

INSERT INTO Mining_Operations VALUES
(701, 'BTC', 'Iceland', '2020-01-01', 100000.00, 50000.00, 'BTCpoolX', 'active', 'John Miner', 'High efficiency'),
(702, 'ETH', 'USA', '2021-02-01', 50000.00, 25000.00, 'ETHpoolY', 'active', 'Jane Hash', 'Ethereum 2.0 ready'),
(703, 'BTC', 'Kazakhstan', '2019-05-01', 80000.00, 40000.00, 'BTCpoolZ', 'inactive', 'Ali Khan', 'Regulatory issues'),
(704, 'ADA', 'Canada', '2022-07-01', 30000.00, 15000.00, 'ADApoolA', 'active', 'Mary Block', 'Low-cost energy'),
(705, 'SOL', 'Germany', '2023-03-01', 20000.00, 10000.00, 'SOLpoolB', 'active', 'Hans Crypto', 'New setup');

-- to remove the data of the table 
TRUNCATE TABLE Mining_Operations;

-- to delete the entire table 
DROP TABLE Mining_Operations;


-- Table-9: Security_Logs
CREATE TABLE Security_Logs (
    log_id INT PRIMARY KEY,
    user_id INT,
    action VARCHAR(100),
    ip_address VARCHAR(50),
    device VARCHAR(50),
    location VARCHAR(100),
    timestamp DATETIME,
    status VARCHAR(20),
    severity VARCHAR(20),
    remarks VARCHAR(255)
);

INSERT INTO Security_Logs VALUES
(801, 101, 'Login', '192.168.0.1', 'Windows PC', 'USA', '2023-06-01 10:00:00', 'success', 'low', 'Normal login'),
(802, 102, 'Password Change', '192.168.0.2', 'iPhone', 'UK', '2023-06-02 15:30:00', 'success', 'medium', 'Security improvement'),
(803, 103, 'Failed Login', '192.168.0.3', 'Android', 'Canada', '2023-06-03 09:45:00', 'failed', 'high', 'Multiple failed attempts'),
(804, 104, 'KYC Upload', '192.168.0.4', 'Windows Laptop', 'Australia', '2023-06-04 14:20:00', 'success', 'low', 'KYC verified'),
(805, 105, 'Withdrawal', '192.168.0.5', 'MacBook', 'Germany', '2023-06-05 18:10:00', 'success', 'medium', 'User withdrawal');

-- to remove the data of the table 
TRUNCATE TABLE Security_Logs;

-- to delete the entire table 
DROP TABLE Security_Logs;


-- Table-10: Support_Tickets
CREATE TABLE Support_Tickets (
    ticket_id INT PRIMARY KEY,
    user_id INT,
    subject VARCHAR(100),
    description TEXT,
    created_at DATE,
    resolved_at DATE,
    status VARCHAR(20),
    priority VARCHAR(20),
    assigned_to VARCHAR(100),
    remarks VARCHAR(255)
);

INSERT INTO Support_Tickets VALUES
(901, 101, 'Withdrawal Delay', 'Funds not received after 24h', '2023-06-01', '2023-06-02', 'resolved', 'high', 'SupportAgent1', 'Bank delay'),
(902, 102, 'KYC Issue', 'KYC not verifying documents', '2023-06-03', NULL, 'pending', 'medium', 'SupportAgent2', 'Awaiting resubmission'),
(903, 103, 'Login Error', 'Unable to login with correct password', '2023-06-05', '2023-06-06', 'resolved', 'high', 'SupportAgent3', 'Cache cleared'),
(904, 104, 'Deposit Missing', 'Deposit not credited', '2023-06-07', NULL, 'pending', 'high', 'SupportAgent1', 'Investigating'),
(905, 105, '2FA Setup', 'Need help with 2FA app', '2023-06-09', '2023-06-10', 'resolved', 'low', 'SupportAgent4', 'Guided setup');

-- to remove the data of the table 
TRUNCATE TABLE Support_Tickets;

-- to delete the entire table 
DROP TABLE Support_Tickets;



