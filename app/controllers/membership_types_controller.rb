class MembershipTypesController < InheritedResources::Base

  private

    def membership_type_params
      params.require(:membership_type).permit(:type)
    end
end