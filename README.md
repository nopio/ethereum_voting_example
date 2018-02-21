# Lunch voting

Lunch voting application is an example how to connect blockchain with ruby on rails using gem ethereum.rb.


## Installation

### Parity 

At the ethereum.rb github repository you can find detailed instruction how to install parity: https://github.com/EthWorks/ethereum.rb/blob/master/PREREQUISITES.md#installing-prerequisites. 

To run dev (local) blockchain use command `parity --chain=dev`. Then visit `localhost:8180` 
you should she parity interface. We will need two wallets for admin and user account. 
You can create it using parity interface. To get your private key go to account manager, 
choose account and click export. It exports your account as json. To encrypt key, use rails console
and run command:
```ruby 
decrypted_key = Eth::Key.decrypt File.read('./some/path.json'), 'account_password'
``` 
Please store your private key in safe place! Yes, I know it’s the DEV instance and there is no risk, 
but good habits are hard to create and I’d rather see you paranoid than complaining that you shared your real private key by mistake.

### Application

Install all gems

```bundle install```

Change admin wallet address in seeds then setup database

```rails db:setup```

and start application

```rails s```

