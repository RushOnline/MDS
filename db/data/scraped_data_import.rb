require "addressable/uri"

require './db/data/data_import'

class ScrapedDataImport < DataImport

    default_file "db/mds.jsonl"

    def process_row

        author_name = row_map["author"]
        author = Author.find_by_name author_name
        if author.nil?
            author = Author.new
            author.name = row_map["author"]
            author.save
            puts "*** add author", author_name
        end
        
        source_name = row_map["source"]
        source = Source.find_by_description source_name
        if source.nil? and not source_name.blank?
            source = Source.new
            source.description = source_name
            source.save
            puts "*** add source", source_name
        end

        title = row_map["name"]
        return unless not title.nil?

        item = MdsFile.find_by_title title
        if item.nil?
            item = MdsFile.new
            item.title = title
            item.author = author
            item.source = source
            item.save
            puts "** add item #{item.inspect}"
        end

        save = false

        if item.url.blank?
            item.url = row_map["url"]
            save = true
        end

        if item.date.blank?
            date = row_map["date"]
            if not date.blank? 
                begin
                    item.date = Date.strptime(date, '%d.%m.%Y')
                    save = true
                rescue ArgumentError
                    puts "EEE invalid date", date
                end
            end
        end

        if item.path.blank? || true
            row_map["links"].each do |link|
                uri = Addressable::URI.parse(link)
                next unless uri.scheme == 'http'
                item.path = (uri.path.starts_with? '/download/') ? uri.path : '/download' + uri.path
                save = true
            end
        end

        if save and item.save
            puts "update #{item.inspect}"
        end

        #puts "#{row_map.inspect}"
    end

end

ScrapedDataImport.run(ARGV[0], ARGV[1])
