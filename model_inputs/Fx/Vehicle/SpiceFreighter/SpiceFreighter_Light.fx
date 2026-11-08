{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "polygon",
			"z": 0.001,
			"kind": 0,
			"args": [
				0
			],
			"children": [
				{
					"type": "material",
					"name": "material",
					"props": {
						"PBR": {
							"mode": "BeforeTonemapping",
							"blend": "Alpha",
							"shadows": false,
							"culling": "None",
							"colorMask": 255,
							"depthTest": "LessEqual",
							"parallax": 0,
							"emissive": 15
						}
					},
					"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
				},
				{
					"type": "shader",
					"name": "AlphaMap",
					"source": "shaders/AlphaMap.hx",
					"props": {
						"useSourceUVs": false,
						"wrap": true,
						"invert": false,
						"replace": false,
						"alpha": 0.59,
						"uScale": 1,
						"vScale": 1,
						"uOffset": 0,
						"vOffset": 0,
						"texture": "Fx/Gradients/T_Square03.jpg",
						"onDecal": false
					},
					"isInstance": true
				},
				{
					"type": "shader",
					"name": "AlphaCycle",
					"source": "shaders/AlphaCycle.hx",
					"props": {
						"minAlpha": 0,
						"maxAlpha": 1,
						"frequency": 1
					},
					"isInstance": true
				},
				{
					"type": "shader",
					"name": "ColorSet",
					"source": "shaders/ColorSet.hx",
					"props": {
						"amount": 1,
						"color": [
							1,
							0.6941176470588235,
							0.4784313725490196
						]
					},
					"isInstance": true
				}
			]
		}
	]
}