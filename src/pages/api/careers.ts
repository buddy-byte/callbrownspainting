import type { APIRoute } from 'astro';

export const POST: APIRoute = async ({ request }) => {
  try {
    const formData = await request.formData();
    const firstName = formData.get('firstName')?.toString() || '';
    const lastName = formData.get('lastName')?.toString() || '';
    const phone = formData.get('phone')?.toString() || '';
    const email = formData.get('email')?.toString() || '';
    const position = formData.get('position')?.toString() || '';
    const experience = formData.get('experience')?.toString() || '';
    const message = formData.get('message')?.toString() || '';

    // Resend API endpoint
    const RESEND_API_KEY = import.meta.env.RESEND_API_KEY;
    
    if (!RESEND_API_KEY) {
      console.error('RESEND_API_KEY not configured');
      return new Response(JSON.stringify({ error: 'Server configuration error' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Send email via Resend
    const response = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${RESEND_API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        from: 'website@callbrownspainting.com',
        to: 'boomer@callbrownspainting.com',
        subject: `New Job Application: ${firstName} ${lastName} - ${position}`,
        html: `
          <h2>New Job Application Received</h2>
          <p><strong>Name:</strong> ${firstName} ${lastName}</p>
          <p><strong>Email:</strong> ${email}</p>
          <p><strong>Phone:</strong> ${phone}</p>
          <p><strong>Position:</strong> ${position}</p>
          <p><strong>Years of Experience:</strong> ${experience}</p>
          <p><strong>Additional Information:</strong></p>
          <p>${message ? message.replace(/\n/g, '<br>') : 'None provided'}</p>
        `
      })
    });

    if (!response.ok) {
      const error = await response.text();
      console.error('Resend API error:', error);
      return new Response(JSON.stringify({ error: 'Failed to send email' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      });
    }

    // Redirect to success page
    return Response.redirect(new URL('/careers?success=true', request.url), 303);

  } catch (error) {
    console.error('Career application error:', error);
    return new Response(JSON.stringify({ error: 'Server error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
};

