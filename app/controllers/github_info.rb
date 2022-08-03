# require_relative "rubygems"
# require_relative "httparty"

class GithubInfo
    include HTTParty
    base_uri "https://api.github.com/users/"

    def initialize(nick_name)
        @account_nick_name = nick_name
    end

    # def account
    #     self.class.get("/" + @account_nick_name.to_s).parsed_response["name"]
    # end

    def repos
        account_info = self.class.get("/" + @account_nick_name.to_s)

        if account_info.code != 200
            return ["Warning", "Cannot find account #{@account_nick_name}"]
        else
            account_name = account_info.parsed_response["name"]
            repo_names = []
            # print self.account "\n"
            self.class.get("/" + @account_nick_name.to_s + "/repos").each do |repo|
                repo_names.append(repo["name"])
            end
            return [account_name, repo_names]
        end
    end
end



    # def retrive_name(response)
    #     response.each do |data|
    #         print data.parsed_response["name"]
    #     end
    # end

    # def acc_info(response)
    #     if response
    #         response
    #     else
    #         "Cannot find account #{@account_nick_name}"
    #     end
    # end


# github_info = GithubInfo.new("therobotisnotatoy")
# github_info.repos



# print github_info.account
# print github_info.repos
# if not github_info.account["name"]
#     print "Cannot find account #{@account_nick_name}"
# else
#     print github_info.account["name"] + "\n"

#     github_info.repos.each do |repo|
#         print " - " + repo["name"] + "\n"
#     end
# end
