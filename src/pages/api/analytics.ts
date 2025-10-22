// Analytics API endpoint for performance monitoring
export async function POST({ request }: { request: Request }) {
  try {
    const data = await request.json();
    
    // Log performance data (in production, you'd send this to your analytics service)
    console.log('Performance Metric:', {
      metric: data.metric,
      value: data.value,
      rating: data.rating,
      timestamp: new Date(data.timestamp).toISOString(),
      url: data.url,
      userAgent: data.userAgent
    });

    // In a real implementation, you would:
    // 1. Send to Google Analytics 4
    // 2. Store in a database
    // 3. Send to monitoring service like DataDog, New Relic, etc.
    
    return new Response(JSON.stringify({ success: true }), {
      status: 200,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'POST',
        'Access-Control-Allow-Headers': 'Content-Type'
      }
    });
  } catch (error) {
    console.error('Analytics API error:', error);
    
    return new Response(JSON.stringify({ error: 'Failed to process analytics data' }), {
      status: 500,
      headers: {
        'Content-Type': 'application/json'
      }
    });
  }
}

// Handle preflight requests
export async function OPTIONS() {
  return new Response(null, {
    status: 200,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type'
    }
  });
}
