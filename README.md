# LiveView August 27 class info. Your homework. 

## 1 Install these tools, plus Elixir, plus Phoenix. 

The tools you will need to install: 

- zoom 
- git (https://git-scm.com/downloads). 
- an editor that you are comfortable with. 
- a working PostgreSQL install

For the development dependencies, you'll need: 

- Elixir 1.10. Make sure it's working: 

run the command: 

```
elixir -v
Erlang/OTP 21 [erts-10.2] [source] [64-bit] [smp:12:12] [ds:12:12:10] [async-threads:1] [hipe]

Elixir 1.10.1 (compiled with Erlang/OTP 21)
```

```
[demo] (master=) ➔ elixir -v
Erlang/OTP 21 [erts-10.2] [source] [64-bit] [smp:12:12] [ds:12:12:10] [async-threads:1] [hipe]

Elixir 1.10.1 (compiled with Erlang/OTP 21)
```

- node.js. Not optional! for Phoenix assets (I'm running npm -v 6.13.4)
- Phoenix 1.5.4 (It includes LiveView.)


Is Phoenix working? Make sure you can run this command: 

```
mix phx.new demo --live
(say yes to fetch dependencies and assets)
```


and make sure you can then create the database: 

```
cd demo
mix ecto.create
```

Don't save this for the last minute! There are a few dependencies that will give you trouble if you've never done this before and decide to wait. 


## 2. Clone this repository

1. Fork this repository to your github account. 

- Go to https://github.com/groxio-learning/liveview1_elixirconf_2020
- Click the `fork` button in the upper right corner
- Navigate to *your local version* (at something like https://github.com/your-github-account/liveview1_elixirconf_2020 )
- copy the clone address to your clipboard. In the upper right, click `clone or download` then `copy to clipboard`

2. Clone your local version to your local machine. 

- Clone it. *REPLACE your-github-account with your account*:  

```
>  git clone https://github.com/your-github-account/liveview1_elixirconf_2020.git
...clones repo...
cd liveview1_elixirconf_2020
```

- Verify your remote: 

```
$ git remote -v
> origin  https://github.com/your-user/liveview1_elixirconf_2020.git (fetch)
> origin  https://github.com/your-user/liveview1_elixirconf_2020.git (push)
```


- If there's no origin, set it. Make sure you *replace your-github-account*:

```
liveview1_elixirconf_2020> git remote add origin https://github.com/your-github-account/liveview1_elixirconf_2020.git
```

- Verify your remote: 

```
$ git remote -v
> origin  https://github.com/your-user/liveview1_elixirconf_2020.git (fetch)
> origin  https://github.com/your-user/liveview1_elixirconf_2020.git (push)
```

- Set the upstream to the Groxio repo:

```
liveview1_elixirconf_2020> git remote add upstream https://github.com/groxio-learning/liveview1_elixirconf_2020.git
```

- Verify the remotes: 

```
> origin  https://github.com/your-user/liveview1_elixirconf_2020.git (fetch)
> origin  https://github.com/your-user/liveview1_elixirconf_2020.git (push)
> upstream  https://github.com/groxio-learning/liveview1_elixirconf_2020.git (fetch)
> upstream  https://github.com/groxio-learning/liveview1_elixirconf_2020.git (push)
```

3. Now check out your setup. Send me a pull request: Edit the file "pull_requests.md" and add your name: 

- git pull upstream master
- Edit pull_requests.md

```
Bruce Tate
Your Name
```

- Commit the file and push

```
> git commit . -m "my commit"

...some happy success message...

> git push origin master

...some happy success message...
```

Now go to your repo online. Click: "Compare and create pull request" 

You're homework is done!

```
[otp] git clone path-to-your-repo
