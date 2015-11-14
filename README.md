# README

## Installing

Clone the repository and run `vagrant up` to fire up the Vagrant machine.

```
git clone http://github.com/ckyu/cs-test.git cs-test
cd cs-test
vagrant up
```

## Running and loading data

After provisioning, the web app should already be running at port 80 of the guest machine (forwarded to port 3000 of the host machine). Accessing http://localhost:3000/ will a list of 10 patients. 

`rake demo:load_data` should generate a set of 1-5 lab tests per patient and send it to the app via the /save API.

If unicorn needs to be restarted for whatever reason, do "sudo /home/vagrant/.rbenv/shims/bundle exec unicorn -c config/unicorn.rb -D".

## Provisioning Errors
* In case of bundler failing to install a gem / gem being corrupted, remove the folder in cache and re-run the bundle install command.

eg. 
```
Bundler::GemspecError: Could not read gem at /home/vagrant/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/cache/nokogiri-1.6.6.2.gem. It may be corrupted.
An error occurred while installing nokogiri (1.6.6.2), and Bundler cannot continue.
Make sure that `gem install nokogiri -v '1.6.6.2'` succeeds before bundling.
```

```
$ rm -rf /home/vagrant/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/cache/nokogiri-1.6.6.2.gem
$ bundle install
```