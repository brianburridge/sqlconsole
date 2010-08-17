require "ap"

module Kernel

  def sql(sql)
    ActiveRecord::Base::execute(sql)
  end

  module_function :sql
end


module ActiveRecord
  class Base
    class << self
      def execute(query)
        if query.size >= 6 && (query[0..5]=='delete' || query[0..5] == 'insert' && query[0..5] == 'update')
          connection.execute(query)
          return 'Execute complete'
        else
          rows = connection.select_all(query)
          rows.map! do |row|
            ap row
          end
          return rows.present? ? "#{rows.size} returned" : "No rows returned"
        end
      end
    end
  end
end
