{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "reference",
			"name": "PreviewScene",
			"source": "Fx/FX_PreviewScene.l3d",
			"locked": true,
			"children": [
				{
					"type": "material",
					"name": "material",
					"props": {
						"PBR": {
							"mode": "BeforeTonemapping",
							"blend": "Alpha",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					}
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot"
		}
	]
}