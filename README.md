# post2zendesk

This gem lets you post a comment to a zendesk ticket, and sets the ticket's status to pending.

## Usage

There's only two ways to use it:

Inline Comment: `post2zendesk <ticketid> <comment>`  
Stdin Comment: `cat somefile | post2zendesk <ticketid>`

E.g.:

```
lolcalhost$ post2zendesk 4698 'A comment.'
Ticket 4698 updated. Probably.
Status: pending
```

## Configuration

You'll need to supply your Zendesk URL, username, and password,

Configure via `~/.post2zendesk.yaml`:

```
---
baseurl: 'support.puppetlabs.com'
username: 'zachary@puppetlabs.com'
password: 'mypassword'
```
