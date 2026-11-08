{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"z": 0.02,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "model",
					"name": "Flag",
					"source": "Fx/Meshes_Common/CurvedPlan.fbx",
					"enabled": false,
					"z": 6.4909,
					"scaleX": 5,
					"scaleY": 8,
					"scaleZ": 0.87,
					"rotationY": 90,
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
									"enableStencil": false
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/water-normal.png"
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 1.8,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/z_FillWhite.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": false,
								"Z": false,
								"texScaleX": 10,
								"texScaleY": 10,
								"tex": "Fx/Alphas/T_NukeVertex.png",
								"intensity": 8,
								"scrollSpeed": [
									0,
									0.1
								]
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
									0.8313725490196078,
									0.8313725490196078,
									0.8313725490196078
								]
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}