# app\javascript\analytics

## Breakdown of `client.js`:

This file handles making API calls to fetch analytics data.

- **`handleFetchAPIErrors` (imported):**
    - This function is imported but not shown in the provided code. 
    - It's likely a utility function that checks for errors in the fetch response and handles them accordingly (e.g., showing an error message).

- **`callAnalyticsAPI(path, date, { organizationId, articleId })`:**
    - This is a helper function that constructs the URL for different analytics API endpoints and makes the actual fetch request.
    - It takes the following arguments:
        - `path`: The specific API endpoint (e.g., `/api/analytics/historical`).
        - `date`: A Date object representing the start date for fetching analytics.
        - `organizationId` (optional): The ID of the organization to filter results by.
        - `articleId` (optional): The ID of the article to filter results by.
    - It constructs the URL dynamically based on the provided arguments.
    - It uses `fetch` to make the API request, handles potential errors with `handleFetchAPIErrors`, and parses the response as JSON.

- **`callHistoricalAPI(date, { organizationId, articleId })`:**
    - This function fetches historical analytics data.
    - It calls `callAnalyticsAPI` with the `/api/analytics/historical` endpoint and the provided arguments.

- **`callReferrersAPI(date, { organizationId, articleId })`:**
    - This function fetches data about referral sources.
    - It calls `callAnalyticsAPI` with the `/api/analytics/referrers` endpoint and the provided arguments.

## Breakdown of `dashboard.js`:

This file handles the logic for displaying analytics data on the dashboard, including rendering charts and cards.

**1. Initialization and Event Listeners:**

- **`activeCharts`:** An object to keep track of active charts to destroy them before creating new ones.
- **`initCharts({ organizationId, articleId })`:**
    - This function initializes the dashboard's analytics functionality.
    - It sets up click event listeners for the "Week," "Month," and "Infinity" time range buttons.
    - When a button is clicked, it calls the corresponding function to draw charts for that time range (e.g., `drawWeekCharts`).
    - By default, it draws the "Week" charts.

**2. Data Processing and Utility Functions:**

- **`resetActive(activeButton)`:**  Highlights the clicked time range button and resets the styles of other buttons.
- **`sumAnalytics(data, key)`:** Calculates the sum of a specific analytic (e.g., page views, reactions) from the provided data.
- **`cardHTML(stat, header)`:** Generates HTML for displaying a statistic in a card format.
- **`writeCards(data, timeRangeLabel)`:** Updates the content of the "Readers," "Reactions," and "Comments" cards with data for the selected time range.
- **`removeCardElements`:** Removes the summary stats cards from the DOM.
- **`showErrorsOnCharts`:** Replaces chart canvases with error messages if fetching chart data fails.
- **`showErrorsOnReferrers`:** Replaces the referrers container with an error message if fetching referrer data fails.

**3. Chart Rendering:**

- **`drawChart({ id, showPoints, title, labels, datasets })`:**
    - This function is responsible for drawing or updating a chart using Chart.js.
    - It takes the following arguments:
        - `id`: The ID of the canvas element where the chart will be drawn.
        - `showPoints`: Boolean indicating whether to display data points on the chart.
        - `title`: The title of the chart.
        - `labels`: An array of labels for the x-axis.
        - `datasets`: An array of datasets to be displayed on the chart.
    - It dynamically imports Chart.js and registers the required components.
    - It checks if a chart with the same ID already exists and destroys it if it does.
    - It creates a new Chart.js instance with the provided data and options.
- **`drawCharts(data, timeRangeLabel)`:**
    - Extracts data for different analytics (comments, reactions, likes, etc.) from the provided data.
    - Determines whether to show data points on the charts based on the `timeRangeLabel`.
    - Calls `drawChart` multiple times to draw charts for reactions, comments, and readers.