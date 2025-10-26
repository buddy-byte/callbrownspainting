# Contact Form Setup Instructions

## What Was Built

Your contact form now sends emails directly to `boomerbrown@callbrownspainting.com` using a Vercel serverless function.

## Files Created:
1. ✅ `/src/pages/api/contact.ts` - Handles form submissions
2. ✅ `/src/pages/contact-success.astro` - Thank you page after submission
3. ✅ Updated `/src/pages/contact.astro` - Form now posts to API

## Setup Required (5 minutes):

### Step 1: Sign Up for Resend (FREE)
1. Go to https://resend.com
2. Sign up with your email
3. Verify your email address

### Step 2: Verify Your Domain
1. In Resend dashboard, click "Domains"
2. Click "Add Domain"
3. Enter: `callbrownspainting.com`
4. Add the DNS records they provide to your domain:
   - Add TXT record for verification
   - Add SPF and DKIM records for email authentication
5. Click "Verify" once DNS records are added

### Step 3: Get Your API Key
1. In Resend dashboard, click "API Keys"
2. Click "Create API Key"
3. Name it: "Production Contact Form"
4. Copy the API key (starts with `re_...`)

### Step 4: Add API Key to Vercel
1. Go to your Vercel dashboard
2. Select your Browns Painting project
3. Go to "Settings" → "Environment Variables"
4. Add new variable:
   - **Name:** `RESEND_API_KEY`
   - **Value:** [paste your Resend API key]
   - **Environment:** Production, Preview, Development (check all)
5. Click "Save"

### Step 5: Deploy
1. Push your code to Git:
   ```bash
   git add .
   git commit -m "Add contact form with email functionality"
   git push
   ```
2. Vercel will automatically deploy
3. Test the form on your live site!

## How It Works

1. User fills out contact form on `/contact`
2. Form submits to `/api/contact`
3. Serverless function sends email via Resend
4. User redirected to `/contact-success`
5. You receive email at `boomerbrown@callbrownspainting.com`

## Email Format

You'll receive emails with:
- **From:** website@callbrownspainting.com
- **To:** boomerbrown@callbrownspainting.com
- **Subject:** "New Contact Form: [user's subject]"
- **Body:** Name, Email, Phone, Subject, Message

## Testing Locally

To test locally:
1. Create `.env` file in project root:
   ```
   RESEND_API_KEY=re_your_api_key_here
   ```
2. Run `npm run dev`
3. Fill out form at `http://localhost:4321/contact`

## Resend Free Tier
- ✅ 100 emails/day
- ✅ 3,000 emails/month
- ✅ Perfect for contact forms

## Troubleshooting

**Form not working?**
1. Check Vercel environment variables are set
2. Check Resend domain is verified
3. Check Vercel function logs in dashboard

**Not receiving emails?**
1. Check spam folder
2. Verify `boomerbrown@callbrownspainting.com` exists
3. Check Resend dashboard for delivery logs

## Cost
- Resend: **FREE** (3,000 emails/month)
- Vercel Functions: **FREE** (included in plan)
- Total: **$0/month** 🎉

