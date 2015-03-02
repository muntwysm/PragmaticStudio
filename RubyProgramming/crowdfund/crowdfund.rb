class Project

	def initialize projectName, projectTargetFunding
		@projectName = projectName
		@projectTargetFunding = projectTargetFunding
	end

	def to_s
		"#{@projectName} project has a Target of $#{@projectTargetFunding}. "
	end

end


x = Project.new('ABC', 3000)
puts x