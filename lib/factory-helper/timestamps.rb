module FactoryHelper
  class Timestamps
    class << self

      def between(from= ::Time.at(0), to= ::Time.now)
        random_time(from, to)
      end

      def forward(from= ::Time.now, seconds= 60)
        to = from + seconds
        random_time(from, to)
      end

      def backward(to= ::Time.now, seconds= 60)
        from = to - seconds
        random_time(from, to)
      end

    private

      def random_time(from, to)
        diff_time = to - from
        dif_in_usec = (diff_time * 1_000_000).to_i
        rand_in_usec = FactoryHelper::Config.random.rand(dif_in_usec-1) + 1 # avoids 0
        rand_in_sec = rand_in_usec.to_f / 1_000_000
        from + rand_in_sec
      end

    end
  end
end
