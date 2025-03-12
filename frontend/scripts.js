async function fetchApiKey() {
    try {
        const response = await fetch('api-key.json');  // Fetching the JSON file
        if (!response.ok) {
            throw new Error('Failed to fetch the API key');
        }
        const data = await response.json();
        console.log('API Key (URL):', data.apiKey);  // Access and log the API key URL
        return data.apiKey;  // Return the API key URL
    } catch (error) {
        console.error('Error:', error);
        throw error;  // Rethrow the error to be handled in updateVisitorCount
    }
}

async function updateVisitorCount() {
    try {
        const apiKeyUrl = await fetchApiKey();  // Fetch the API key URL
        const response = await fetch(apiKeyUrl);  // Use the API key URL to fetch visitor count
        if (!response.ok) {
            throw new Error('Failed to fetch visitor count');
        }
        const data = await response.json();
        document.getElementById('visitor-count').innerText = data.count;  // Display visitor count
    } catch (error) {
        console.error('Error fetching visitor count:', error);
        document.getElementById('visitor-count').innerText = 'Error';
    }
}

updateVisitorCount();
