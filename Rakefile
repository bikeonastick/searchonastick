require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :benchmark, [:x] do |t,rargs|
  require 'csv'
  require 'searchonastick/textfiles'
  require 'searchonastick/searcher'


  repetition = (rargs.x.to_i > 0)? rargs.x.to_i : 1
  #pluralize message
  s = (repetition > 1) ? 's' : ''
  puts "benchmarking... looping #{repetition} time#{s}"


  bench_file=CSV.open('benchmark/search_compare.csv','w')
  bench_file << ['search_method', 'search_term', 'search_bm', 'index_bm', 'r0', 'r0_count', 'r1', 'r1_count', 'r2', 'r2_count']

  search_words = ['French', 'France', 'Norman', 'an', 'to', 'rest', 
                  'witnessed', 'eccentric', 'incarnations', 'platypus', 
                  'notawordwillnotfind', 'relativistic', 'hyperspace']

  textfiles = Searchonastick::Textfiles.new

  # Searcher args
  # 0|1|2, textfiles, <searchword>, keep, reuse
  
  search_args = [ [ 2, true, false], [ 2, false, true], [ 0, false, false],
    [ 1, false, false], [ 2, false, true], [ 1, false, false],
    [ 0, false, false], [ 2, false, true], [ 1, false, false],
    [ 0, false, false], [ 2, false, true], [ 1, false, false],
    [ 1, false, false], [ 1, false, false], [ 0, false, false],
    [ 2, false, true], [ 0, false, false], [ 0, false, false],
    [ 2, false, true], [ 1, false, false], [ 1, false, false],
    [ 2, false, true], [ 1, false, false], [ 1, false, false],
    [ 2, false, true], [ 2, false, true], [ 2, false, true],
    [ 2, false, true], [ 0, false, false], [ 0, false, false],
    [ 0, false, false], [ 0, false, false], [ 1, false, false],
    [ 1, false, false], [ 1, false, false], [ 1, false, false],
    [ 0, false, false], [ 1, false, false], [ 2, false, true],
    [ 0, false, false], [ 1, false, false], [ 2, false, true],
    [ 0, false, false], [ 1, false, false], [ 2, false, true],
    [ 0, false, false], [ 1, false, false], [ 2, false, true],
    [ 0, false, false], [ 1, false, false]
  ]

  repetition.times do
    search_args.each{|args|

      search_term = search_words[rand(0..12)]

      searcher = Searchonastick::Searcher.new(
        args[0], textfiles, search_term, args[1], args[2])

      search_results = searcher.search

      full_results_count = 0
      results_map = {}
      search_results.each{|result|
        full_results_count += result.count
        results_map[result.name] = result.count
      }

      sorted_results = results_map.sort_by{|k,v| -v}.to_h

      index_bm = (args[0] == 2)? (searcher.index_benchmark.total * 1000) : 'N/A'

      bench_file << [args[0], search_term,
                     (searcher.search_benchmark.total * 1000), index_bm, 
                     sorted_results.keys[0], sorted_results.values[0], 
                     sorted_results.keys[1], sorted_results.values[1], 
                     sorted_results.keys[2], sorted_results.values[2] 
      ]
    }
  end

  bench_file.close()

end
