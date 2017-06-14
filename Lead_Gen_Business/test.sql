-- 1. What query would you run to get the total revenue for March of 2012?

SELECT 
    MONTHNAME(billing.charged_datetime) AS month,
    SUM(billing.amount) AS revenue
FROM
    billing
WHERE
    billing.charged_datetime LIKE '2012-03%';

-- 2. What query would you run to get total revenue collected from the client with an id of 2?

SELECT 
    clients.client_id, SUM(billing.amount) AS revenue
FROM
    billing
        JOIN
    clients ON clients.client_id = billing.client_id
WHERE
    clients.client_id = 2;

-- 3. What query would you run to get all the sites that client=10 owns?

SELECT 
    sites.domain_name AS website, clients.client_id
FROM
    clients
        JOIN
    sites ON clients.client_id = sites.client_id
WHERE
    clients.client_id = 10;

-- 4. What query would you run to get total # of sites created per month per year for the client with an
--  id of 1? What about for client=20?

SELECT 
    clients.client_id,
    COUNT(sites.domain_name) AS num_of_websites,
    MONTHNAME(sites.created_datetime) AS month,
    YEAR(sites.created_datetime) AS year
FROM
    clients
        JOIN
    sites ON clients.client_id = sites.client_id
WHERE
    clients.client_id = 1
GROUP BY sites.domain_name;

-- 5. What query would you run to get the total # of leads generated for each of the sites between January 1, 2011 
-- to February 15, 2011?

SELECT 
    sites.domain_name,
    COUNT(leads.leads_id) AS number_leads,
    DATE(leads.registered_datetime) AS date_generated
FROM
    leads
        JOIN
    sites ON leads.site_id = sites.site_id
WHERE
    leads.registered_datetime BETWEEN '2011-01-01' AND '2011-02-15'
GROUP BY leads.leads_id;

-- 6. What query would you run to get a list of client names and the total # of leads we've generated for each of our
--  clients between January 1, 2011 to December 31, 2011?

SELECT 
    CONCAT_WS(' ',
            clients.first_name,
            clients.last_name) AS client_name,
    COUNT(leads.leads_id) AS total_leads
FROM
    clients
        JOIN
    sites ON clients.client_id = sites.client_id
        JOIN
    leads ON sites.site_id = leads.site_id
WHERE
    leads.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY client_name
ORDER BY clients.last_name ASC;

-- 7. What query would you run to get a list of client names and the total # of leads we've generated for each client
-- each month between months 1 - 6 of Year 2011?

SELECT 
    CONCAT_WS(' ',
            clients.first_name,
            clients.last_name) AS client_name,
    COUNT(leads.leads_id) AS num_leads,
    MONTHNAME(leads.registered_datetime) AS month_generated
FROM
    clients
        JOIN
    sites ON clients.client_id = sites.client_id
        JOIN
    leads ON sites.site_id = leads.site_id
WHERE
    leads.registered_datetime BETWEEN '2011-01-01' AND '2011-06-30'
GROUP BY leads.leads_id;

-- 8. What query would you run to get a list of client names and the total # of leads we've generated for each of our
-- clients' sites between January 1, 2011 to December 31, 2011? Order this query by client id.  Come up with a second
-- query that shows all the clients, the site name(s), and the total number of leads generated from each site for all time.

SELECT 
    CONCAT_WS(' ',
            clients.first_name,
            clients.last_name) AS client_name,
    sites.domain_name AS website,
    COUNT(leads.leads_id) AS num_leads,
    DATE_FORMAT(leads.registered_datetime, '%M %d %Y') AS date_generated
FROM
    clients
        JOIN
    sites ON clients.client_id = sites.client_id
        JOIN
    leads ON sites.site_id = leads.site_id
WHERE
    leads.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY sites.domain_name
ORDER BY clients.client_id;

SELECT 
    CONCAT_WS(' ',
            clients.first_name,
            clients.last_name) AS client_name,
    sites.domain_name AS website,
    COUNT(leads.leads_id) AS num_leads
FROM
    clients
        JOIN
    sites ON clients.client_id = sites.client_id
        JOIN
    leads ON sites.site_id = leads.site_id
GROUP BY clients.client_id , website;

-- 9. Write a single query that retrieves total revenue collected from each client for each month of the year.
-- Order it by client id.

SELECT 
    CONCAT_WS(' ',
            clients.first_name,
            clients.last_name) AS client_name,
    SUM(billing.amount) AS monthly_revenue,
    MONTHNAME(billing.charged_datetime) AS 'month',
    YEAR(billing.charged_datetime) AS 'year'
FROM
    clients
        LEFT JOIN
    billing ON clients.client_id = billing.client_id
GROUP BY clients.client_id , year , MONTH(billing.charged_datetime);

-- 10. Write a single query that retrieves all the sites that each client owns. Group the results so that each row shows 
-- a new client. It will become clearer when you add a new field called 'sites' that has all the sites that the client owns.
--  (HINT: use GROUP_CONCAT)

SELECT 
    CONCAT_WS(' ',
            clients.first_name,
            clients.last_name) AS client_name,
    GROUP_CONCAT(sites.domain_name) AS websites
FROM
    clients
        LEFT JOIN
    sites ON clients.client_id = sites.client_id
GROUP BY clients.client_id;






