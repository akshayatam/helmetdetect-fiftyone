# 🦺 Helmet Detection with YOLOv5 (Trained from Scratch) + FiftyOne Visualization

![Project Banner](link-to-your-thumbnail.png)

A deep-dive computer vision project where I trained a custom YOLOv5 model **from scratch** on a 3-class dataset (`helmet`, `head`, `person`) — and evaluated it using [FiftyOne](https://voxel51.com/fiftyone/), the open-source tool for visualizing and debugging model predictions.

> 🔍 *"Not just building a model — but understanding it."*

---

## 🚀 Project Overview

- 🔧 Trained **YOLOv5m** from scratch on **5,000 images**
- 🧠 Classes: `helmet`, `head`, `person`
- 📊 Visualized predictions vs ground truth using **FiftyOne**
- 🧪 Evaluated performance with COCO-style metrics (mAP, precision, recall)
- 💡 Debugged failure modes interactively (false positives, low IoU, etc.)

---

## 📁 Project Structure

```
helmet-detection/
├── data/
├── notebooks/ # YOLOv5 outputs
│ └── fo-viz.ipynb
│ └── helmet-detection.ipynb
├── visualize_predictions.py # FiftyOne script to compare GT and predictions
├── README.md
├── data.yaml # YOLO dataset config
└── requirements.txt
```

---

## 📊 Final Evaluation Results

| Class    | Precision | Recall | mAP@0.5 | mAP@0.5:0.95 |
|----------|-----------|--------|--------|---------------|
| **helmet** | 0.933     | 0.883  | 0.945  | 0.603         |
| **head**   | 0.887     | 0.792  | 0.854  | 0.542         |
| **person** | 0.000     | 0.000  | 0.000  | 0.000         |
| **All**    | 0.607     | 0.558  | 0.600  | 0.382         |

> The `person` class underperformed due to label imbalance — clearly visible in FiftyOne's UI.

---

## How to Run 

After cloning the repository, run `script.sh` to download the dataset in the `data/` folder. 

```bash 
sh script.sh 
``` 

Install dependencies 

```bash 
pip install -r requirements.txt 
``` 

Run the starter `helmet-detection.ipynb` file from the `notebooks/` folder. 

Clone YOLOv5 repository 

```bash 
git clone https://github.com/ultralytics/yolov5.git 
cd yolov5
``` 

Train YOLOv5 

```bash 
python train.py \
  --img 416 \
  --batch 32 \
  --epochs 200 \
  --data ../data.yaml \
  --cfg models/yolov5m.yaml \
  --weights '' \
  --rect \
  --name helmet_boosted
``` 

Run inference 

```bash 
python detect.py \
  --weights runs/train/helmet_boosted/weights/best.pt \
  --source ../data/images/val \
  --save-txt \
  --save-conf \
  --project ../runs/detect \
  --name helmet_preds
``` 

Once complete, you can view `fo-viz.ipynb` to have a visualization of your model. 

## Key Takeaways
- Training YOLOv5 from scratch is possible with the right tuning.
- FiftyOne helps go beyond mAP and visually debug every prediction.
- Visual tools + modeling = real understanding. 

## Future Works 
- Refactoring the code more efficiently 

## Credits 
- [YOLOv5](https://github.com/ultralytics/yolov5)
- [FiftyOne](https://github.com/voxel51/fiftyone)
- Inspired by a conversation with Daniel Gural, MLE @ Voxel51