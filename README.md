# cocoapods-podInstalLocalDepencencies

PodInstalLocalDepencencies is a cocoapods-plugin that helps to manage **Local Dependencies** and **Development Pods** that are referenced in your `Podfile` with a `:path` definded.

## Getting Started

### Installation

    $ gem install cocoapods-podInstalLocalDepencencies
    
#### Or with Bundler:

* Install Bundler:

    `$ gem install bundler`
    
* Create a `Gemfile` in the project root folder and add this line to it:

    `gem 'cocoapods-podInstalLocalDepencencies'`
    
* Run the Bundler installation command:

    `$ bundle install`

### Setting up

* In your `Podfile` add this line at the top of the file:

    `plugin 'cocoapods-podInstalLocalDepencencies'`

* Set the `:PLD_local_dependencies` option on `install!` object with an Array of `{ 'Framwork name' => 'Relative framework path'}`. Eg.:

    ```
    install! 'cocoapods',
      :PLD_local_dependencies => {
        'Framework1' => './relative/path/to/framework1',
        'Framework2' => './relative/path/to/framework2',
      }
    ```

Final `Podfile`:

```
plugin 'cocoapods-podInstalLocalDepencencies'

install! 'cocoapods',
      :PLD_local_dependencies => {
        'Framework1' => './relative/path/to/framework1',
        'Framework2' => './relative/path/to/framework2',
      }

target 'Project' do
    pod 'Podname1', :path => './relative/path/to/framework1'
    pod 'Podname2', :path => './relative/path/to/framework2'
end
```

## Usage

Run `pod install` with `--local-dependencies` to force running `pod install` for local dependencies defined at `:PLD_local_dependencies`:

    $ pod install --local-dependencies
