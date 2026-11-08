{
	"type": "fx",
	"cullingRadius": 150,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
			"scaleX": 200,
			"scaleY": 200,
			"scaleZ": 140,
			"rotationZ": 180,
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
							"mode": "PBR",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"z": -2.55,
			"scaleX": 1.5,
			"scaleY": 1.5,
			"scaleZ": 1.5,
			"children": [
				{
					"type": "model",
					"name": "VerniusBase",
					"source": "Structure/Base/Vernius/VerniusBase.fbx",
					"editorOnly": true,
					"locked": true
				},
				{
					"type": "object",
					"name": "right",
					"children": [
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High_ElectricSparkles",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_ElectricSparkles.fx",
							"x": -0.62822,
							"y": -6.46046,
							"z": 3.61246,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationX": 13.1,
							"rotationY": 57.6,
							"rotationZ": -79.2,
							"time": 0.13168
						},
						{
							"type": "subFX",
							"name": "02 - FX_Directional_Explosion_High_ElectricSparkles",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_ElectricSparkles.fx",
							"x": -0.19871,
							"y": 4.588659999999999,
							"z": 6.75391,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"rotationX": -101.69999999999999,
							"rotationY": 125.59999999999997,
							"rotationZ": -39.499999999999986,
							"time": 0.18993
						},
						{
							"type": "subFX",
							"name": "03 - FX_Directional_Explosion_High_ElectricSparkles",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_ElectricSparkles.fx",
							"x": -3.90851,
							"y": -3.0168,
							"z": 9.64221,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"rotationX": -56.3,
							"rotationY": -79.7,
							"rotationZ": 84.4,
							"time": 0.24129
						},
						{
							"type": "subFX",
							"name": "04 - FX_Directional_Explosion_High_ElectricSparkles",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_ElectricSparkles.fx",
							"x": -0.3328,
							"y": 1.21085,
							"z": 17.17912,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"rotationX": -21.1,
							"rotationY": 50.9,
							"rotationZ": 19.2,
							"time": 0.27289
						},
						{
							"type": "subFX",
							"name": "05 - FX_Directional_Explosion_High_ElectricSparkles",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_ElectricSparkles.fx",
							"x": -2.87917,
							"y": -3.11406,
							"z": 22.1454,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"rotationX": 9.6,
							"rotationY": 43.3,
							"rotationZ": -83.7,
							"time": 0.30055
						}
					]
				}
			]
		}
	]
}