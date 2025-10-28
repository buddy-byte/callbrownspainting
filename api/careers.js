export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  try {
    const { firstName, lastName, phone, email, position, experience, message } = req.body;

    const RESEND_API_KEY = process.env.RESEND_API_KEY;
    
    if (!RESEND_API_KEY) {
      console.error('RESEND_API_KEY not configured');
      return res.status(500).json({ error: 'Server configuration error' });
    }

    // Send email via Resend
    const response = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${RESEND_API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        from: 'onboarding@resend.dev',
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
      return res.status(500).json({ error: 'Failed to send email' });
    }

    // Redirect to careers success page
    return res.redirect(303, '/careers-success');

  } catch (error) {
    console.error('Career application error:', error);
    return res.status(500).json({ error: 'Server error' });
  }
}

