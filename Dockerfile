FROM mono:4.6.1.3

# copy the current repo to container
COPY . /

# restore all the nugets
RUN nuget restore Refit.sln

# builds the main solution file
# we are ignoring all the projects except Net45
RUN xbuild Refit.sln

# run the xUnit tests
RUN xbuild Refit-Tests/Refit-Tests-Net45.csproj

RUN xbuild Refit-Tests/Refit-Tests-Net45.csproj /t:GenerateRefitStubs