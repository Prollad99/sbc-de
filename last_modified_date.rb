module Jekyll
  class LastModifiedGenerator < Generator
    priority :high

    def generate(site)
      index_page = site.pages.find { |page| page.name == 'index.html' }
      if index_page
        index_path = File.join(site.source, index_page.path)
        last_modified_time = File.mtime(index_path)
        index_page.data['last_modified_date'] = last_modified_time
      end
    end
  end
end
