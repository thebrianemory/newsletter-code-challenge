# Your task is to build a Newsletter Sending System using Elixir/Phoenix.
## What it should do
- [ ] A not logged-in user will see a form requesting their email, which will allow them to subscribe to the newsletter. 
- [ ] The user of the system (i.e. author of the newsletter) can write a newsletter and send it to all the subscribers (by email).
Keep in mind that in a real-life scenario, there may be 10-100k subscribers, so sending emails in a synchronous way (e.g. calling a send_mail(email, body) function while looping all the subscribers) is not a valid option.


## Bonus points if:
 - [ ] Subscription is confirmed by sending an email with a ‘Confirm your subscription’ link
 - [ ] A newsletter can be scheduled to be sent at any time in the future (usually, newsletters are sent in a biweekly or monthly schedule)
 - [ ] Automated testing is included
