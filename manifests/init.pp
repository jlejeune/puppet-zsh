#
# Install and configure zsh / oh-my-zsh combo
#

class zsh {

  # include ohmyzsh class using parameters defined in hiera
  include '::ohmyzsh'

  # install powerlevel9k ohmyzsh theme for jlejeune user
  vcsrepo { '/home/jlejeune/.oh-my-zsh/custom/themes/powerlevel9k':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/bhilburn/powerlevel9k.git',
    user     => 'jlejeune',
    require  => Ohmyzsh::Install['jlejeune'],
  }

  # add custom zsh config files
  file { '/home/jlejeune/.oh-my-zsh/custom/aliases.zsh':
    ensure   => file,
    source   => "puppet:///modules/${module_name}/aliases.zsh",
    owner    => 'jlejeune',
    require  => Ohmyzsh::Install['jlejeune'],
  }
}
