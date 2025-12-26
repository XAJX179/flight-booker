# tests are run by default
desc "run test and rubocop"
task :default do
  sh "rubocop -a"
  puts "rake completed."
end
