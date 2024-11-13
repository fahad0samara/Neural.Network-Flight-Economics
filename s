{"metadata":{"kernelspec":{"language":"python","display_name":"Python 3","name":"python3"},"language_info":{"name":"python","version":"3.10.14","mimetype":"text/x-python","codemirror_mode":{"name":"ipython","version":3},"pygments_lexer":"ipython3","nbconvert_exporter":"python","file_extension":".py"},"kaggle":{"accelerator":"none","dataSources":[{"sourceId":9890317,"sourceType":"datasetVersion","datasetId":6074019}],"dockerImageVersionId":30786,"isInternetEnabled":true,"language":"python","sourceType":"notebook","isGpuEnabled":false}},"nbformat_minor":4,"nbformat":4,"cells":[{"cell_type":"code","source":"import pandas as pd\n\ndf = pd.read_csv('/kaggle/input/economic-indicators-dataset/economy.csv')\ndf.head()","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:17:41.946696Z","iopub.execute_input":"2024-11-13T04:17:41.947107Z","iopub.status.idle":"2024-11-13T04:17:43.948559Z","shell.execute_reply.started":"2024-11-13T04:17:41.947060Z","shell.execute_reply":"2024-11-13T04:17:43.947381Z"}},"outputs":[{"execution_count":1,"output_type":"execute_result","data":{"text/plain":"         date   airline ch_code  num_code dep_time   from time_taken  \\\n0  11-02-2022  SpiceJet      SG      8709    18:55  Delhi    02h 10m   \n1  11-02-2022  SpiceJet      SG      8157    06:20  Delhi    02h 20m   \n2  11-02-2022   AirAsia      I5       764    04:25  Delhi    02h 10m   \n3  11-02-2022   Vistara      UK       995    10:20  Delhi    02h 15m   \n4  11-02-2022   Vistara      UK       963    08:50  Delhi    02h 20m   \n\n        stop arr_time      to  price  \n0  non-stop     21:05  Mumbai  5,953  \n1  non-stop     08:40  Mumbai  5,953  \n2  non-stop     06:35  Mumbai  5,956  \n3  non-stop     12:35  Mumbai  5,955  \n4  non-stop     11:10  Mumbai  5,955  ","text/html":"<div>\n<style scoped>\n    .dataframe tbody tr th:only-of-type {\n        vertical-align: middle;\n    }\n\n    .dataframe tbody tr th {\n        vertical-align: top;\n    }\n\n    .dataframe thead th {\n        text-align: right;\n    }\n</style>\n<table border=\"1\" class=\"dataframe\">\n  <thead>\n    <tr style=\"text-align: right;\">\n      <th></th>\n      <th>date</th>\n      <th>airline</th>\n      <th>ch_code</th>\n      <th>num_code</th>\n      <th>dep_time</th>\n      <th>from</th>\n      <th>time_taken</th>\n      <th>stop</th>\n      <th>arr_time</th>\n      <th>to</th>\n      <th>price</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <th>0</th>\n      <td>11-02-2022</td>\n      <td>SpiceJet</td>\n      <td>SG</td>\n      <td>8709</td>\n      <td>18:55</td>\n      <td>Delhi</td>\n      <td>02h 10m</td>\n      <td>non-stop</td>\n      <td>21:05</td>\n      <td>Mumbai</td>\n      <td>5,953</td>\n    </tr>\n    <tr>\n      <th>1</th>\n      <td>11-02-2022</td>\n      <td>SpiceJet</td>\n      <td>SG</td>\n      <td>8157</td>\n      <td>06:20</td>\n      <td>Delhi</td>\n      <td>02h 20m</td>\n      <td>non-stop</td>\n      <td>08:40</td>\n      <td>Mumbai</td>\n      <td>5,953</td>\n    </tr>\n    <tr>\n      <th>2</th>\n      <td>11-02-2022</td>\n      <td>AirAsia</td>\n      <td>I5</td>\n      <td>764</td>\n      <td>04:25</td>\n      <td>Delhi</td>\n      <td>02h 10m</td>\n      <td>non-stop</td>\n      <td>06:35</td>\n      <td>Mumbai</td>\n      <td>5,956</td>\n    </tr>\n    <tr>\n      <th>3</th>\n      <td>11-02-2022</td>\n      <td>Vistara</td>\n      <td>UK</td>\n      <td>995</td>\n      <td>10:20</td>\n      <td>Delhi</td>\n      <td>02h 15m</td>\n      <td>non-stop</td>\n      <td>12:35</td>\n      <td>Mumbai</td>\n      <td>5,955</td>\n    </tr>\n    <tr>\n      <th>4</th>\n      <td>11-02-2022</td>\n      <td>Vistara</td>\n      <td>UK</td>\n      <td>963</td>\n      <td>08:50</td>\n      <td>Delhi</td>\n      <td>02h 20m</td>\n      <td>non-stop</td>\n      <td>11:10</td>\n      <td>Mumbai</td>\n      <td>5,955</td>\n    </tr>\n  </tbody>\n</table>\n</div>"},"metadata":{}}],"execution_count":1},{"cell_type":"code","source":"# Shape of the dataframe\n{df.shape}\n\ndf.info()\n\n# Descriptive statistics for numerical columns\ndf.describe()\n\n\n\ndf['airline'].unique()\n\n\ndf['stop'].unique()\n\n\ndf['from'].unique()\n\n\ndf['to'].unique()\n\n# Check data type of 'price' column\ndf['price'].dtype\n\n# Convert 'price' column to numeric only if it's of type 'object'\nif df['price'].dtype == 'object':\n    df['price'] = df['price'].str.replace(',', '').astype(float)\n\n# Verify data type after conversion\ndf['price'].dtype","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:22:57.101497Z","iopub.execute_input":"2024-11-13T04:22:57.102518Z","iopub.status.idle":"2024-11-13T04:22:57.273764Z","shell.execute_reply.started":"2024-11-13T04:22:57.102474Z","shell.execute_reply":"2024-11-13T04:22:57.272751Z"}},"outputs":[{"name":"stdout","text":"<class 'pandas.core.frame.DataFrame'>\nRangeIndex: 206774 entries, 0 to 206773\nData columns (total 11 columns):\n #   Column      Non-Null Count   Dtype  \n---  ------      --------------   -----  \n 0   date        206774 non-null  object \n 1   airline     206774 non-null  object \n 2   ch_code     206774 non-null  object \n 3   num_code    206774 non-null  int64  \n 4   dep_time    206774 non-null  object \n 5   from        206774 non-null  object \n 6   time_taken  206774 non-null  object \n 7   stop        206774 non-null  object \n 8   arr_time    206774 non-null  object \n 9   to          206774 non-null  object \n 10  price       206774 non-null  float64\ndtypes: float64(1), int64(1), object(9)\nmemory usage: 17.4+ MB\n","output_type":"stream"},{"execution_count":12,"output_type":"execute_result","data":{"text/plain":"dtype('float64')"},"metadata":{}}],"execution_count":12},{"cell_type":"code","source":"# Clean the 'stop' column\ndf['stop'] = df['stop'].str.strip()  # Remove leading/trailing whitespace\ndf['stop'] = df['stop'].str.replace('\\n', '')  # Remove newline characters\ndf['stop'] = df['stop'].str.replace('\\t', '')  # Remove tab characters\n# Standardize values\ndf['stop'] = df['stop'].replace({'non-stop': '0-stop'})\ndf['stop'] = df['stop'].str.split('Via').str[0].str.strip()  # Extract number of stops\nprint(df['stop'].unique())\n","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:23:29.436692Z","iopub.execute_input":"2024-11-13T04:23:29.437098Z","iopub.status.idle":"2024-11-13T04:23:30.149483Z","shell.execute_reply.started":"2024-11-13T04:23:29.437062Z","shell.execute_reply":"2024-11-13T04:23:30.148347Z"}},"outputs":[{"name":"stdout","text":"['0-stop' '1-stop' '2+-stop']\n","output_type":"stream"}],"execution_count":13},{"cell_type":"code","source":"# Print the shape of the dataframe before removing duplicates.\nprint(\"Shape of dataframe before removing duplicates:\", df.shape)\n\n# Identify and remove duplicate rows, keeping only the first occurrence.\ndf.drop_duplicates(inplace=True)\n\n# Print the shape of the dataframe after removing duplicates.\nprint(\"Shape of dataframe after removing duplicates:\", df.shape)","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:23:45.435226Z","iopub.execute_input":"2024-11-13T04:23:45.435643Z","iopub.status.idle":"2024-11-13T04:23:45.656135Z","shell.execute_reply.started":"2024-11-13T04:23:45.435604Z","shell.execute_reply":"2024-11-13T04:23:45.654986Z"}},"outputs":[{"name":"stdout","text":"Shape of dataframe before removing duplicates: (206774, 11)\nShape of dataframe after removing duplicates: (206772, 11)\n","output_type":"stream"}],"execution_count":14},{"cell_type":"code","source":"# Convert text to lowercase\ndf['airline'] = df['airline'].str.lower()\ndf['from'] = df['from'].str.lower()\ndf['to'] = df['to'].str.lower()\ndf['stop'] = df['stop'].str.lower()\n\n# Remove punctuation\ndf['airline'] = df['airline'].str.replace('[^\\w\\s]', '', regex=True)\ndf['from'] = df['from'].str.replace('[^\\w\\s]', '', regex=True)\ndf['to'] = df['to'].str.replace('[^\\w\\s]', '', regex=True)\ndf['stop'] = df['stop'].str.replace('[^\\w\\s]', '', regex=True)\n\n# Strip whitespace\ndf['airline'] = df['airline'].str.strip()\ndf['from'] = df['from'].str.strip()\ndf['to'] = df['to'].str.strip()\ndf['stop'] = df['stop'].str.strip()\n\n# Standardize 'stop' column\ndf['stop'] = df['stop'].str.replace('nonstop', '0stop')\ndf['stop'] = df['stop'].str.replace('1 stop', '1stop')\ndf['stop'] = df['stop'].str.replace('2 stops', '2stop')\ndf['stop'] = df['stop'].str.replace('3 stops', '3stop')\ndf['stop'] = df['stop'].str.replace('4 stops', '4stop')","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:23:57.539200Z","iopub.execute_input":"2024-11-13T04:23:57.539619Z","iopub.status.idle":"2024-11-13T04:23:58.781361Z","shell.execute_reply.started":"2024-11-13T04:23:57.539563Z","shell.execute_reply":"2024-11-13T04:23:58.780231Z"}},"outputs":[],"execution_count":15},{"cell_type":"code","source":"df.to_csv('cleaned_economy.csv', index=False)","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:24:18.661851Z","iopub.execute_input":"2024-11-13T04:24:18.662303Z","iopub.status.idle":"2024-11-13T04:24:19.654390Z","shell.execute_reply.started":"2024-11-13T04:24:18.662261Z","shell.execute_reply":"2024-11-13T04:24:19.653277Z"}},"outputs":[],"execution_count":16},{"cell_type":"code","source":"df_cleaned = pd.read_csv('/kaggle/working/cleaned_economy.csv')\ndf_cleaned.head()","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:32:04.234748Z","iopub.execute_input":"2024-11-13T04:32:04.235342Z","iopub.status.idle":"2024-11-13T04:32:04.589395Z","shell.execute_reply.started":"2024-11-13T04:32:04.235284Z","shell.execute_reply":"2024-11-13T04:32:04.588268Z"}},"outputs":[{"execution_count":35,"output_type":"execute_result","data":{"text/plain":"         date   airline ch_code  num_code dep_time   from time_taken   stop  \\\n0  11-02-2022  spicejet      SG      8709    18:55  delhi    02h 10m  0stop   \n1  11-02-2022  spicejet      SG      8157    06:20  delhi    02h 20m  0stop   \n2  11-02-2022   airasia      I5       764    04:25  delhi    02h 10m  0stop   \n3  11-02-2022   vistara      UK       995    10:20  delhi    02h 15m  0stop   \n4  11-02-2022   vistara      UK       963    08:50  delhi    02h 20m  0stop   \n\n  arr_time      to   price  \n0    21:05  mumbai  5953.0  \n1    08:40  mumbai  5953.0  \n2    06:35  mumbai  5956.0  \n3    12:35  mumbai  5955.0  \n4    11:10  mumbai  5955.0  ","text/html":"<div>\n<style scoped>\n    .dataframe tbody tr th:only-of-type {\n        vertical-align: middle;\n    }\n\n    .dataframe tbody tr th {\n        vertical-align: top;\n    }\n\n    .dataframe thead th {\n        text-align: right;\n    }\n</style>\n<table border=\"1\" class=\"dataframe\">\n  <thead>\n    <tr style=\"text-align: right;\">\n      <th></th>\n      <th>date</th>\n      <th>airline</th>\n      <th>ch_code</th>\n      <th>num_code</th>\n      <th>dep_time</th>\n      <th>from</th>\n      <th>time_taken</th>\n      <th>stop</th>\n      <th>arr_time</th>\n      <th>to</th>\n      <th>price</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <th>0</th>\n      <td>11-02-2022</td>\n      <td>spicejet</td>\n      <td>SG</td>\n      <td>8709</td>\n      <td>18:55</td>\n      <td>delhi</td>\n      <td>02h 10m</td>\n      <td>0stop</td>\n      <td>21:05</td>\n      <td>mumbai</td>\n      <td>5953.0</td>\n    </tr>\n    <tr>\n      <th>1</th>\n      <td>11-02-2022</td>\n      <td>spicejet</td>\n      <td>SG</td>\n      <td>8157</td>\n      <td>06:20</td>\n      <td>delhi</td>\n      <td>02h 20m</td>\n      <td>0stop</td>\n      <td>08:40</td>\n      <td>mumbai</td>\n      <td>5953.0</td>\n    </tr>\n    <tr>\n      <th>2</th>\n      <td>11-02-2022</td>\n      <td>airasia</td>\n      <td>I5</td>\n      <td>764</td>\n      <td>04:25</td>\n      <td>delhi</td>\n      <td>02h 10m</td>\n      <td>0stop</td>\n      <td>06:35</td>\n      <td>mumbai</td>\n      <td>5956.0</td>\n    </tr>\n    <tr>\n      <th>3</th>\n      <td>11-02-2022</td>\n      <td>vistara</td>\n      <td>UK</td>\n      <td>995</td>\n      <td>10:20</td>\n      <td>delhi</td>\n      <td>02h 15m</td>\n      <td>0stop</td>\n      <td>12:35</td>\n      <td>mumbai</td>\n      <td>5955.0</td>\n    </tr>\n    <tr>\n      <th>4</th>\n      <td>11-02-2022</td>\n      <td>vistara</td>\n      <td>UK</td>\n      <td>963</td>\n      <td>08:50</td>\n      <td>delhi</td>\n      <td>02h 20m</td>\n      <td>0stop</td>\n      <td>11:10</td>\n      <td>mumbai</td>\n      <td>5955.0</td>\n    </tr>\n  </tbody>\n</table>\n</div>"},"metadata":{}}],"execution_count":35},{"cell_type":"code","source":"import pandas as pd\nimport numpy as np\n\n# Calculate the Interquartile Range (IQR) for the 'price' column\nQ1 = df_cleaned['price'].quantile(0.25)\nQ3 = df_cleaned['price'].quantile(0.75)\nIQR = Q3 - Q1\n\n# Define upper and lower bounds for outlier detection\nupper_bound = Q3 + 1.5 * IQR\nlower_bound = Q1 - 1.5 * IQR\n\n# Identify potential outliers in the 'price' column\noutliers = df_cleaned[(df_cleaned['price'] < lower_bound) | (df_cleaned['price'] > upper_bound)]\n\n# Print the number of potential outliers found\nprint(f\"Number of potential outliers: {len(outliers)}\")","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:32:33.511109Z","iopub.execute_input":"2024-11-13T04:32:33.511537Z","iopub.status.idle":"2024-11-13T04:32:33.529631Z","shell.execute_reply.started":"2024-11-13T04:32:33.511496Z","shell.execute_reply":"2024-11-13T04:32:33.528392Z"}},"outputs":[{"name":"stdout","text":"Number of potential outliers: 13750\n","output_type":"stream"}],"execution_count":36},{"cell_type":"code","source":"print(f\"Shape of df_cleaned before removing outliers: {df_cleaned.shape}\")\ndf_cleaned.drop(outliers.index, inplace=True)\nprint(f\"Shape of df_cleaned after removing outliers: {df_cleaned.shape}\")\n\n","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:32:45.088739Z","iopub.execute_input":"2024-11-13T04:32:45.089153Z","iopub.status.idle":"2024-11-13T04:32:45.125144Z","shell.execute_reply.started":"2024-11-13T04:32:45.089117Z","shell.execute_reply":"2024-11-13T04:32:45.123992Z"}},"outputs":[{"name":"stdout","text":"Shape of df_cleaned before removing outliers: (206772, 11)\nShape of df_cleaned after removing outliers: (193022, 11)\n","output_type":"stream"}],"execution_count":37},{"cell_type":"code","source":"import pandas as pd\nfrom sklearn.preprocessing import MinMaxScaler\n\n# Create a MinMaxScaler object\nscaler = MinMaxScaler()\n\n# Select numerical features for scaling\nnumerical_features = ['num_code', 'price']\n\n# Convert 'time_taken' to numerical format if needed\n# Assuming 'time_taken' is in the format 'HHh MMm'\ndf_cleaned['time_taken'] = df_cleaned['time_taken'].str.replace('h', ':').str.replace('m', '').str.strip()\n\n# Handle cases like '2:30' (2 hours 30 minutes) to '2:30:00'\ndf_cleaned['time_taken'] = df_cleaned['time_taken'] + ':00'\n\n# Convert to timedelta and get total minutes\ndf_cleaned['time_taken'] = pd.to_timedelta(df_cleaned['time_taken'], errors='coerce').dt.total_seconds() / 60\n\n# Check for conversion errors\nif df_cleaned['time_taken'].isnull().any():\n    print(\"Warning: Some rows could not be converted. Check for invalid formats.\")\n\n# Add 'time_taken' to numerical features\nnumerical_features.append('time_taken')\n\n# Apply Min-Max scaling\ndf_cleaned[numerical_features] = scaler.fit_transform(df_cleaned[numerical_features])\n","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:33:01.021002Z","iopub.execute_input":"2024-11-13T04:33:01.021451Z","iopub.status.idle":"2024-11-13T04:33:01.097287Z","shell.execute_reply.started":"2024-11-13T04:33:01.021409Z","shell.execute_reply":"2024-11-13T04:33:01.095668Z"}},"outputs":[{"traceback":["\u001b[0;31m---------------------------------------------------------------------------\u001b[0m","\u001b[0;31mAttributeError\u001b[0m                            Traceback (most recent call last)","Cell \u001b[0;32mIn[39], line 12\u001b[0m\n\u001b[1;32m      8\u001b[0m numerical_features \u001b[38;5;241m=\u001b[39m [\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mnum_code\u001b[39m\u001b[38;5;124m'\u001b[39m, \u001b[38;5;124m'\u001b[39m\u001b[38;5;124mprice\u001b[39m\u001b[38;5;124m'\u001b[39m]\n\u001b[1;32m     10\u001b[0m \u001b[38;5;66;03m# Convert 'time_taken' to numerical format if needed\u001b[39;00m\n\u001b[1;32m     11\u001b[0m \u001b[38;5;66;03m# Assuming 'time_taken' is in the format 'HHh MMm'\u001b[39;00m\n\u001b[0;32m---> 12\u001b[0m df_cleaned[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mtime_taken\u001b[39m\u001b[38;5;124m'\u001b[39m] \u001b[38;5;241m=\u001b[39m \u001b[43mdf_cleaned\u001b[49m\u001b[43m[\u001b[49m\u001b[38;5;124;43m'\u001b[39;49m\u001b[38;5;124;43mtime_taken\u001b[39;49m\u001b[38;5;124;43m'\u001b[39;49m\u001b[43m]\u001b[49m\u001b[38;5;241;43m.\u001b[39;49m\u001b[43mstr\u001b[49m\u001b[38;5;241m.\u001b[39mreplace(\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mh\u001b[39m\u001b[38;5;124m'\u001b[39m, \u001b[38;5;124m'\u001b[39m\u001b[38;5;124m:\u001b[39m\u001b[38;5;124m'\u001b[39m)\u001b[38;5;241m.\u001b[39mstr\u001b[38;5;241m.\u001b[39mreplace(\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mm\u001b[39m\u001b[38;5;124m'\u001b[39m, \u001b[38;5;124m'\u001b[39m\u001b[38;5;124m'\u001b[39m)\u001b[38;5;241m.\u001b[39mstr\u001b[38;5;241m.\u001b[39mstrip()\n\u001b[1;32m     14\u001b[0m \u001b[38;5;66;03m# Handle cases like '2:30' (2 hours 30 minutes) to '2:30:00'\u001b[39;00m\n\u001b[1;32m     15\u001b[0m df_cleaned[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mtime_taken\u001b[39m\u001b[38;5;124m'\u001b[39m] \u001b[38;5;241m=\u001b[39m df_cleaned[\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mtime_taken\u001b[39m\u001b[38;5;124m'\u001b[39m] \u001b[38;5;241m+\u001b[39m \u001b[38;5;124m'\u001b[39m\u001b[38;5;124m:00\u001b[39m\u001b[38;5;124m'\u001b[39m\n","File \u001b[0;32m/opt/conda/lib/python3.10/site-packages/pandas/core/generic.py:6299\u001b[0m, in \u001b[0;36mNDFrame.__getattr__\u001b[0;34m(self, name)\u001b[0m\n\u001b[1;32m   6292\u001b[0m \u001b[38;5;28;01mif\u001b[39;00m (\n\u001b[1;32m   6293\u001b[0m     name \u001b[38;5;129;01mnot\u001b[39;00m \u001b[38;5;129;01min\u001b[39;00m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_internal_names_set\n\u001b[1;32m   6294\u001b[0m     \u001b[38;5;129;01mand\u001b[39;00m name \u001b[38;5;129;01mnot\u001b[39;00m \u001b[38;5;129;01min\u001b[39;00m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_metadata\n\u001b[1;32m   6295\u001b[0m     \u001b[38;5;129;01mand\u001b[39;00m name \u001b[38;5;129;01mnot\u001b[39;00m \u001b[38;5;129;01min\u001b[39;00m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_accessors\n\u001b[1;32m   6296\u001b[0m     \u001b[38;5;129;01mand\u001b[39;00m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_info_axis\u001b[38;5;241m.\u001b[39m_can_hold_identifiers_and_holds_name(name)\n\u001b[1;32m   6297\u001b[0m ):\n\u001b[1;32m   6298\u001b[0m     \u001b[38;5;28;01mreturn\u001b[39;00m \u001b[38;5;28mself\u001b[39m[name]\n\u001b[0;32m-> 6299\u001b[0m \u001b[38;5;28;01mreturn\u001b[39;00m \u001b[38;5;28;43mobject\u001b[39;49m\u001b[38;5;241;43m.\u001b[39;49m\u001b[38;5;21;43m__getattribute__\u001b[39;49m\u001b[43m(\u001b[49m\u001b[38;5;28;43mself\u001b[39;49m\u001b[43m,\u001b[49m\u001b[43m \u001b[49m\u001b[43mname\u001b[49m\u001b[43m)\u001b[49m\n","File \u001b[0;32m/opt/conda/lib/python3.10/site-packages/pandas/core/accessor.py:224\u001b[0m, in \u001b[0;36mCachedAccessor.__get__\u001b[0;34m(self, obj, cls)\u001b[0m\n\u001b[1;32m    221\u001b[0m \u001b[38;5;28;01mif\u001b[39;00m obj \u001b[38;5;129;01mis\u001b[39;00m \u001b[38;5;28;01mNone\u001b[39;00m:\n\u001b[1;32m    222\u001b[0m     \u001b[38;5;66;03m# we're accessing the attribute of the class, i.e., Dataset.geo\u001b[39;00m\n\u001b[1;32m    223\u001b[0m     \u001b[38;5;28;01mreturn\u001b[39;00m \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_accessor\n\u001b[0;32m--> 224\u001b[0m accessor_obj \u001b[38;5;241m=\u001b[39m \u001b[38;5;28;43mself\u001b[39;49m\u001b[38;5;241;43m.\u001b[39;49m\u001b[43m_accessor\u001b[49m\u001b[43m(\u001b[49m\u001b[43mobj\u001b[49m\u001b[43m)\u001b[49m\n\u001b[1;32m    225\u001b[0m \u001b[38;5;66;03m# Replace the property with the accessor object. Inspired by:\u001b[39;00m\n\u001b[1;32m    226\u001b[0m \u001b[38;5;66;03m# https://www.pydanny.com/cached-property.html\u001b[39;00m\n\u001b[1;32m    227\u001b[0m \u001b[38;5;66;03m# We need to use object.__setattr__ because we overwrite __setattr__ on\u001b[39;00m\n\u001b[1;32m    228\u001b[0m \u001b[38;5;66;03m# NDFrame\u001b[39;00m\n\u001b[1;32m    229\u001b[0m \u001b[38;5;28mobject\u001b[39m\u001b[38;5;241m.\u001b[39m\u001b[38;5;21m__setattr__\u001b[39m(obj, \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_name, accessor_obj)\n","File \u001b[0;32m/opt/conda/lib/python3.10/site-packages/pandas/core/strings/accessor.py:191\u001b[0m, in \u001b[0;36mStringMethods.__init__\u001b[0;34m(self, data)\u001b[0m\n\u001b[1;32m    188\u001b[0m \u001b[38;5;28;01mdef\u001b[39;00m \u001b[38;5;21m__init__\u001b[39m(\u001b[38;5;28mself\u001b[39m, data) \u001b[38;5;241m-\u001b[39m\u001b[38;5;241m>\u001b[39m \u001b[38;5;28;01mNone\u001b[39;00m:\n\u001b[1;32m    189\u001b[0m     \u001b[38;5;28;01mfrom\u001b[39;00m \u001b[38;5;21;01mpandas\u001b[39;00m\u001b[38;5;21;01m.\u001b[39;00m\u001b[38;5;21;01mcore\u001b[39;00m\u001b[38;5;21;01m.\u001b[39;00m\u001b[38;5;21;01marrays\u001b[39;00m\u001b[38;5;21;01m.\u001b[39;00m\u001b[38;5;21;01mstring_\u001b[39;00m \u001b[38;5;28;01mimport\u001b[39;00m StringDtype\n\u001b[0;32m--> 191\u001b[0m     \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_inferred_dtype \u001b[38;5;241m=\u001b[39m \u001b[38;5;28;43mself\u001b[39;49m\u001b[38;5;241;43m.\u001b[39;49m\u001b[43m_validate\u001b[49m\u001b[43m(\u001b[49m\u001b[43mdata\u001b[49m\u001b[43m)\u001b[49m\n\u001b[1;32m    192\u001b[0m     \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_is_categorical \u001b[38;5;241m=\u001b[39m \u001b[38;5;28misinstance\u001b[39m(data\u001b[38;5;241m.\u001b[39mdtype, CategoricalDtype)\n\u001b[1;32m    193\u001b[0m     \u001b[38;5;28mself\u001b[39m\u001b[38;5;241m.\u001b[39m_is_string \u001b[38;5;241m=\u001b[39m \u001b[38;5;28misinstance\u001b[39m(data\u001b[38;5;241m.\u001b[39mdtype, StringDtype)\n","File \u001b[0;32m/opt/conda/lib/python3.10/site-packages/pandas/core/strings/accessor.py:245\u001b[0m, in \u001b[0;36mStringMethods._validate\u001b[0;34m(data)\u001b[0m\n\u001b[1;32m    242\u001b[0m inferred_dtype \u001b[38;5;241m=\u001b[39m lib\u001b[38;5;241m.\u001b[39minfer_dtype(values, skipna\u001b[38;5;241m=\u001b[39m\u001b[38;5;28;01mTrue\u001b[39;00m)\n\u001b[1;32m    244\u001b[0m \u001b[38;5;28;01mif\u001b[39;00m inferred_dtype \u001b[38;5;129;01mnot\u001b[39;00m \u001b[38;5;129;01min\u001b[39;00m allowed_types:\n\u001b[0;32m--> 245\u001b[0m     \u001b[38;5;28;01mraise\u001b[39;00m \u001b[38;5;167;01mAttributeError\u001b[39;00m(\u001b[38;5;124m\"\u001b[39m\u001b[38;5;124mCan only use .str accessor with string values!\u001b[39m\u001b[38;5;124m\"\u001b[39m)\n\u001b[1;32m    246\u001b[0m \u001b[38;5;28;01mreturn\u001b[39;00m inferred_dtype\n","\u001b[0;31mAttributeError\u001b[0m: Can only use .str accessor with string values!"],"ename":"AttributeError","evalue":"Can only use .str accessor with string values!","output_type":"error"}],"execution_count":39},{"cell_type":"code","source":"import pandas as pd\n\n# Date and time features\ndf_cleaned['date'] = pd.to_datetime(df_cleaned['date'], format='%d-%m-%Y', errors='coerce')  # Add errors='coerce' to handle invalid date formats\ndf_cleaned['day_of_week'] = df_cleaned['date'].dt.dayofweek\ndf_cleaned['month'] = df_cleaned['date'].dt.month\n# Extract hour from 'dep_time' using string manipulation or regular expressions.\ndf_cleaned['dep_hour'] = pd.to_datetime(df_cleaned['dep_time'], format='%H:%M', errors='coerce').dt.hour  # Add errors='coerce' to handle invalid time formats\n\n# One-hot encoding for categorical features\ncategorical_features = ['airline', 'from', 'to', 'stop', 'ch_code']\nfor feature in categorical_features:\n    if feature in df_cleaned.columns:  # Check if the column exists before one-hot encoding\n        df_cleaned = pd.get_dummies(df_cleaned, columns=[feature], prefix=[feature], dummy_na=False)\n\n# Drop original columns\n# Assuming 'date', 'dep_time', 'arr_time', 'time_taken' are the original columns to be dropped\ncolumns_to_drop = ['date', 'dep_time', 'arr_time', 'time_taken']\ndf_cleaned = df_cleaned.drop(columns=columns_to_drop, errors='ignore')\n\n","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:33:18.154268Z","iopub.execute_input":"2024-11-13T04:33:18.154755Z","iopub.status.idle":"2024-11-13T04:33:18.510129Z","shell.execute_reply.started":"2024-11-13T04:33:18.154714Z","shell.execute_reply":"2024-11-13T04:33:18.509054Z"}},"outputs":[],"execution_count":40},{"cell_type":"code","source":"df_cleaned.to_csv('transformed_economy.csv', index=False)\n","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:33:40.207607Z","iopub.execute_input":"2024-11-13T04:33:40.208045Z","iopub.status.idle":"2024-11-13T04:33:42.656302Z","shell.execute_reply.started":"2024-11-13T04:33:40.208004Z","shell.execute_reply":"2024-11-13T04:33:42.655137Z"}},"outputs":[],"execution_count":41},{"cell_type":"code","source":"import pandas as pd\n\ndf_transformed = pd.read_csv('/kaggle/working/transformed_economy.csv')\ndf_transformed.head()\ndf_transformed.shape","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T04:34:31.939059Z","iopub.execute_input":"2024-11-13T04:34:31.939944Z","iopub.status.idle":"2024-11-13T04:34:32.541641Z","shell.execute_reply.started":"2024-11-13T04:34:31.939900Z","shell.execute_reply":"2024-11-13T04:34:32.540560Z"}},"outputs":[{"execution_count":43,"output_type":"execute_result","data":{"text/plain":"(193022, 36)"},"metadata":{}}],"execution_count":43},{"cell_type":"code","source":"from sklearn.metrics import mean_squared_error, mean_absolute_error\nfrom sklearn.model_selection import train_test_split\nfrom tensorflow.keras.models import Sequential\nfrom tensorflow.keras.layers import Dense, Dropout\n\n# Step 1: Split the data into train and test sets\ntrain_data, test_data = train_test_split(df_transformed, test_size=0.2, random_state=42)\n\n# Separate features and target variable\nX_train = train_data.drop('price', axis=1)\ny_train = train_data['price']\nX_test = test_data.drop('price', axis=1)\ny_test = test_data['price']\nprint(X_train.isnull().sum().sum())  # يجب أن تكون النتيجة 0\nprint(X_test.isnull().sum().sum())\n# Step 2: Define the model\nmodel = Sequential()\nmodel.add(Input(shape=(X_train.shape[1],)))\n\nmodel.add(Dense(128, activation='relu'))  # Input layer\n\nmodel.add(Dense(64, activation='relu'))\n\n\n\nmodel.add(Dense(1, activation='linear'))  # Output layer\n\n# Compile the model\nmodel.compile(optimizer='adam', loss='mean_squared_error', metrics=['mean_absolute_error'])\n\n# Step 3: Train the model\nmodel.fit(X_train, y_train, epochs=50, batch_size=32)\n\n# Step 4: Predict on the test set\ny_test_pred = model.predict(X_test)\n\n# Step 5: Calculate evaluation metrics on the test set\ntest_mse = mean_squared_error(y_test, y_test_pred)\ntest_mae = mean_absolute_error(y_test, y_test_pred)\n\n# Print evaluation metrics\nprint(f\"Test MSE: {test_mse:.2f}, Test MAE: {test_mae:.2f}\")\n","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T05:35:50.678899Z","iopub.execute_input":"2024-11-13T05:35:50.679438Z","iopub.status.idle":"2024-11-13T05:41:22.651711Z","shell.execute_reply.started":"2024-11-13T05:35:50.679389Z","shell.execute_reply":"2024-11-13T05:41:22.650503Z"}},"outputs":[{"name":"stdout","text":"0\n0\nEpoch 1/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0602 - mean_absolute_error: 0.1419\nEpoch 2/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0184 - mean_absolute_error: 0.0995\nEpoch 3/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0170 - mean_absolute_error: 0.0933\nEpoch 4/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0163 - mean_absolute_error: 0.0908\nEpoch 5/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0158 - mean_absolute_error: 0.0886\nEpoch 6/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0155 - mean_absolute_error: 0.0875\nEpoch 7/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0155 - mean_absolute_error: 0.0873\nEpoch 8/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0150 - mean_absolute_error: 0.0855\nEpoch 9/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0149 - mean_absolute_error: 0.0852\nEpoch 10/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0149 - mean_absolute_error: 0.0850\nEpoch 11/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0147 - mean_absolute_error: 0.0843\nEpoch 12/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0146 - mean_absolute_error: 0.0840\nEpoch 13/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0146 - mean_absolute_error: 0.0839\nEpoch 14/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0145 - mean_absolute_error: 0.0834\nEpoch 15/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0143 - mean_absolute_error: 0.0827\nEpoch 16/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0143 - mean_absolute_error: 0.0827\nEpoch 17/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0143 - mean_absolute_error: 0.0826\nEpoch 18/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0144 - mean_absolute_error: 0.0829\nEpoch 19/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0142 - mean_absolute_error: 0.0823\nEpoch 20/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0143 - mean_absolute_error: 0.0823\nEpoch 21/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0142 - mean_absolute_error: 0.0823\nEpoch 22/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0141 - mean_absolute_error: 0.0818\nEpoch 23/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0140 - mean_absolute_error: 0.0814\nEpoch 24/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0139 - mean_absolute_error: 0.0813\nEpoch 25/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0141 - mean_absolute_error: 0.0818\nEpoch 26/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0139 - mean_absolute_error: 0.0809\nEpoch 27/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0137 - mean_absolute_error: 0.0803\nEpoch 28/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0140 - mean_absolute_error: 0.0813\nEpoch 29/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0139 - mean_absolute_error: 0.0808\nEpoch 30/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0136 - mean_absolute_error: 0.0803\nEpoch 31/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0139 - mean_absolute_error: 0.0808\nEpoch 32/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0138 - mean_absolute_error: 0.0804\nEpoch 33/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0137 - mean_absolute_error: 0.0803\nEpoch 34/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0138 - mean_absolute_error: 0.0805\nEpoch 35/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0136 - mean_absolute_error: 0.0800\nEpoch 36/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0137 - mean_absolute_error: 0.0804\nEpoch 37/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0137 - mean_absolute_error: 0.0801\nEpoch 38/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0138 - mean_absolute_error: 0.0801\nEpoch 39/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0137 - mean_absolute_error: 0.0799\nEpoch 40/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0137 - mean_absolute_error: 0.0799\nEpoch 41/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0136 - mean_absolute_error: 0.0797\nEpoch 42/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0137 - mean_absolute_error: 0.0801\nEpoch 43/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0135 - mean_absolute_error: 0.0797\nEpoch 44/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0134 - mean_absolute_error: 0.0791\nEpoch 45/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0135 - mean_absolute_error: 0.0795\nEpoch 46/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0133 - mean_absolute_error: 0.0789\nEpoch 47/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0134 - mean_absolute_error: 0.0793\nEpoch 48/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0135 - mean_absolute_error: 0.0791\nEpoch 49/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m6s\u001b[0m 1ms/step - loss: 0.0134 - mean_absolute_error: 0.0791\nEpoch 50/50\n\u001b[1m4826/4826\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m7s\u001b[0m 1ms/step - loss: 0.0134 - mean_absolute_error: 0.0791\n\u001b[1m1207/1207\u001b[0m \u001b[32m━━━━━━━━━━━━━━━━━━━━\u001b[0m\u001b[37m\u001b[0m \u001b[1m1s\u001b[0m 1ms/step\nTest MSE: 0.01, Test MAE: 0.08\n","output_type":"stream"}],"execution_count":57},{"cell_type":"code","source":"from sklearn.metrics import r2_score\n\n# حساب R² للتنبؤات\nval_r2 = r2_score(y_test , y_test_pred)\n\nprint(f\"Validation R²: {val_r2:.2f}\")\n","metadata":{"trusted":true,"execution":{"iopub.status.busy":"2024-11-13T05:41:50.422737Z","iopub.execute_input":"2024-11-13T05:41:50.423166Z","iopub.status.idle":"2024-11-13T05:41:50.431594Z","shell.execute_reply.started":"2024-11-13T05:41:50.423121Z","shell.execute_reply":"2024-11-13T05:41:50.430311Z"}},"outputs":[{"name":"stdout","text":"Validation R²: 0.71\n","output_type":"stream"}],"execution_count":58}]}