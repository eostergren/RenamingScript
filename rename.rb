all_files = Dir.entries('.')
track_number = 0
name_start_offset = 7
song_name = String.new
new_filename = String.new
all_files.each { |file_list| 
   if file_list.include? '.txt'
      puts file_list + ":"
      song_name_list = File.open file_list
      song_name_list.each { |line|
      track_id = line[/[dD]\d[tT]\d\d/]
          if track_id != nil
              song_name = line.slice(name_start_offset, line.size - name_start_offset)
              song_name.chop!
              all_files.each { |file_name|
                  if file_name.include? track_id
                      track_number+=1
                      new_filename = sprintf( '%2d_%s.flac', track_number, song_name)
                       if new_filename[0] == ' '
                          new_filename[0] = '0'
                       end 
                       puts "rename  " + file_name + " to " + new_filename
					   File.rename(file_name, new_filename)
                  end
              }
           end
      }
   puts ""
   end
}

