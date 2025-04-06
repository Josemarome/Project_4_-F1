# 🏎️ Formula 1 Race Winner Prediction (2015–2025)

## 📡 Project Overview  
This project uses a neural network model to predict the winner of a Formula 1 race based on historical race data, retrieved from the [Jolpi.ca F1 API](https://jolpi.ca/) — a modern, developer-friendly interface for accessing Ergast data.

The workflow includes:  
- Dynamic data fetching from Jolpi’s API  
- Data cleaning, encoding, and scaling  
- Iterative deep learning model optimization using TensorFlow/Keras  
- Logging model performance across multiple architectures  
- Predicting future race winners (e.g., Round 1 of 2025)

---

## 📡 API Source: Jolpi.ca  
The Jolpi F1 API provides fast and clean access to race data including:
- Season  
- Round  
- Race results (Driver placement and names)

**API endpoint used**:


https://api.jolpi.ca/ergast/f1/{season}/results.json


---


Replace `{season}` with a year (e.g., 2024) to fetch the data for that season.

---

## 🧠 Model & Optimization  
The script tests **three different neural network configurations**, each with varying:
- Layer sizes  
- Dropout rates  
- Learning rates  
- Batch sizes  

Performance is logged and evaluated based on:
- **Test Accuracy**  
- **Test Loss**

### ✅ Best Model Example:
Architecture: [64, 128, 64]
Dropout: 0.3
Learning Rate: 0.001
Batch Size: 42
Test Accuracy: 100%
Test Loss: 0.655


All configurations are logged in:  
`model_optimization_log.csv`

---

## 🏁 Final Prediction  
The trained model is used to predict the winner for the **first race of the 2025 season**:

> 🏆 **Predicted Winner**: Piastri

---

## 📊 Tableau Dashboard

Explore visual insights from the same dataset used in the model training process via an interactive Tableau dashboard:

🔗 **[F1 Championship Insights 2015–2024 (Tableau Public)](https://public.tableau.com/app/profile/valeria.jimenez.paz/viz/Formula12015-2024/F1ChampionshipInsights20152024)**

![F1 Dashboard Preview](https://github.com/user-attachments/assets/d4d5c8f0-0cce-49fa-b8e0-1f61ff4a06a7)


This dashboard includes:
- 🏁 Pit Stop Duration Analysis (by circuit, driver, and time of day)  
- 🌍 Longest Race Countries  
- 🧠 Performance breakdown by driver and constructor  
- ⏱️ Strategic insights across seasons  

All data was sourced from **CSV exports** derived from the same API-based pipeline used in the Python model.  
It provides a visual storytelling layer to support and validate the machine learning predictions.

---

## 📁 Data Sources

Race data was exported from the [Jolpi.ca F1 API](https://jolpi.ca/) for the seasons 2015–2024.  
After exporting, we **cleaned the files by removing unused or irrelevant columns** (e.g. URLs, nationality details, redundant IDs) to streamline the analysis and focus on performance-related features.

### ✅ Cleaned CSV Files Used:
- `f1_circuits_2015_2024_cleaned.csv`  
- `f1_constructor_standings_2015_2024_cleaned.csv`  
- `f1_constructors_2015_2024_cleaned.csv`  
- `f1_driver_standings_2015_2024_cleaned.csv`  
- `f1_drivers_2015_2024_cleaned.csv`  
- `f1_pitstops_2015_2024_cleaned.csv`  
- `f1_qualifying_results_2015_2024_cleaned.csv`  
- `f1_race_results_2015_2024_cleaned.csv`  

These cleaned files were used to create the visual dashboards in Tableau and also informed the design of the predictive model in Python.  
They are connected using shared keys such as `raceId`, `driverId`, `constructorId`, and `circuitId` to support relational joins and cross-feature analysis.

---

## 📂 Project Structure

📁 Project_4_-_F1/
├── 📁 Output/                 → Model outputs, prediction logs, or images
├── 📁 Resources/Cleaned/     → Cleaned data used in modeling and Tableau
├── 📄 Final_Analysis_Formula_1_Race_Prediction.ipynb → Notebook with full pipeline
├── 📄 README.md              → Project overview and insights


---

## 🚀 Future Roadmap
- Add race-specific features (qualifying, constructor, grid position)  
- Expand with full Jolpi API endpoints (e.g., `/pitstops`, `/qualifying`)  
- Include visual performance comparison (bar plots, heatmaps)  
- Try ensemble models (e.g., XGBoost) for benchmarking  
