# Rails Test Project

NOTE: This is an empty Rails 4.1 project. Please fork it, and submit a pull request. You're free to use any gems, or tools that you like to complete these tasks.

**Goal**: Create a customer registration form that allows a customer to register their business with some brokers.

The registration should be a 3 stage process. The 3 stages are:

1. Selection of brokers
2. Registration details
3. Supporting documents uploads

The 3 stages are detailed more below.

## 1. Selection of brokers
The goal is to allow the customer to choose which brokers they wish to register with.

**Functional requirements:**
- The user should be allowed to select up to 3 brokers, but no more.
- The customer should not be able to proceed without selecting at least one broker

**Design requirements:**
- Present the selection of these brokers as 6 boxes
- Make the selected status (selected/not selected) visually appealing and clear to the user

## 2. Registration
The goal of the registration page is to help the user complete the form fields in a straightforward and guiding way.

**Functional requirements:**
- Use good judgement for validation considerations, and where to handle them (client vs server).
- The registration form needs to be dynamic, whereby it displays certain fields only in certain company types.

The 6 types of companies and their form fields are below

1. **Charity**
  1. Full name*
  2. Address
  3. Charity number
  4. Email address
2. **Limited company**
  1. Company name*
  2. Registration number
  3. Email address
  4. Names of up to 4 Directors*
3. **Partnership**
  1. Full name*
  2. Address
  3. Registration number
  4. Names of up to 4 Partners
4. **Public limited company**
  1. Company name*
  2. Listed on exchange?
  3. Registration number
5. **Trust**
  1. Full name*
  2. Address
  3. Names of all trustees
6. **Sole trader**
  1. Full name*
  2. Address

**Design requirements:**
- The form should dynamically show the correct fields depending on the company type selected
- Only when the user has completed the minimal fields (marked with *), should the user be allowed to proceed to the next stage

While not essential, effort on making the UX good with transitions and animations, wherever relevant, would be great.

## 3. Supporting Documents
Allow the user to upload any supporting documents required for their registration.

**Functional requirements:**
- In this test scenario, only limited company registrants need to require supporting documents. They will need to upload 1 file:


1. **Proof of address**

For all other company types the registration can allow the user to proceed to the next stage without being asked for a document to upload.

Once the customer has completed all 3 steps, they should see a thank you page.
