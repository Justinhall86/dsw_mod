{
	"type": "fx",
	"duration": 2.25,
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
			"children": [
				{
					"type": "object",
					"name": "Impact",
					"children": [
						{
							"type": "subFX",
							"name": "FX_Electricity_Impact",
							"source": "Fx/Explosion/FX_Electricity_Impact.fx",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 1.71,
							"time": -0.153365842401983
						},
						{
							"type": "subFX",
							"name": "Flare",
							"source": "Fx/Vehicle/Drones/VerniusDrones/Flare.fx",
							"z": 1,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"time": -0.10336584240198496
						}
					]
				}
			]
		}
	]
}