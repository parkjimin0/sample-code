class CumulativeCellData
    def initialize(beehive)
      @beehive = beehive
    end
  
    def values
        {
            empty: empty,
            honey: honey,
            pollen: pollen,
            egg: egg,
            larvae: larvae,
            pupa: pupa,
        }.deep_stringify_keys
    end
  
    private

    def empty
       cell_type_data("empty")
    end

    def honey
        cell_type_data("honey")
    end

    def pollen
        cell_type_data("pollen")
    end

    def egg
        cell_type_data("egg")
    end

    def larvae
        cell_type_data("larvae")
    end

    def pupa
        cell_type_data("pupa")
    end

    def cell_type_data(type_name)
        type = CellType.find_by(name: type_name)
        @cells = Cell.where(beehive_id: @beehive.id, cell_type_id: type.id)
        count = @cells.count
        data = {
            cell_ids: []  ,
            count: count,
            percentage: count.to_f/total_cell_count * 100
        }
        @cells.each do |cell| data[:cell_ids] << cell.id end
        data
    end

    def total_cell_count
        Cell.where(beehive_id: @beehive.id).count.to_f
    end
  end