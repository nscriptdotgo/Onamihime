-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','Acc')
	state.CastingMode:options('Normal','Resistant')
	state.IdleMode:options('Normal','PDT')
	state.AutoBuffMode:options('Off','Auto','AutoDyna')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons')

	gear.mnd_jse_back = {name="Alaunus's Cape",augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}}
	gear.fc_jse_cape = {name="Alaunus's Cape",augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}
  
		  -- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')
  
	select_default_macro_book()
end
  
  -- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Izcalli",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Izcalli",sub="Nehushtan"}

	sets.buff.Sublimation = {}
	sets.buff.DTSublimation = {}

	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
		main="Grioavolr", --5
		sub="Clerisy Strap", --8
		ammo="Incantor Stone", --2
		head="Bunzi's Hat",
		body="Inyanga Jubbah +2", --14
		hands="Gende. Gages +1", --7
		legs="Aya. Cosciales +2", --6
		feet="Regal Pumps +1", --7
		neck="Voltsurge Torque", --4
		ear1="Loquacious Earring", --2
		ear2="Malignance Earring", --1
		ring1="Lebeche Ring", --4
		ring2="Weather. Ring", --6(4)
		back=gear.fc_jse_cape,
		waist="Embla Sash", --5
	}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
		ammo="Incantor Stone",
		main="Queller Rod",
		sub="Sors Shield",
		legs="Ebers Pant. +1", --12
		ear1="Nourish. Earring +1", --5
		ear2="Nourish. Earring", --4
	})

	sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

	sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {})

	sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Ammurapi Shield"})

	-- Precast sets to enhance JAs
	sets.precast.JA.Benediction = {body="Piety Bliaut +3"}

		-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Nahtirah Hat",ear1="Roundel Earring",
		body="Piety Bliaut +3",hands="Telchine Gloves",
		waist="Chaac Belt",back=gear.mnd_jse_back
	}

	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Theophany Cap +2",neck="Asperity Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
		body="Kaykaus Bliaut",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Buquwik Cape",waist="Fotia Belt",legs="Assid. Pants +1",feet="Gende. Galosh. +1"}

	sets.precast.WS.Dagan = {ammo="Hasty Pinion +1",
		head="Theophany Cap +2",neck="Asperity Necklace",ear1="Moonshade Earring",ear2="Etiolation Earring",
		body="Kaykaus Bliaut",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Buquwik Cape",waist="Fotia Belt",legs="Assid. Pants +1",feet="Gende. Galosh. +1"}

	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.MaxTP.Dagan = {ear1="Evans Earring",ear2="Etiolation Earring"}

	--sets.precast.WS['Flash Nova'] = {}

	--sets.precast.WS['Mystic Boon'] = {}

	-- Midcast Sets

	sets.Kiting = {feet="Herald's Gaiters"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})

	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {
		-- neck="Phalaina Locket",
		-- ring1="Kunaji Ring",
		-- ring2="Asklepian Ring",
		waist="Gishdubar Sash"
	}
	sets.Cure_Received = {
		-- neck="Phalaina Locket",
		-- ring1="Kunaji Ring",
		-- ring2="Asklepian Ring",
		waist="Gishdubar Sash"
	}
	sets.Self_Refresh = {
		-- back="Grapevine Cape",
		waist="Gishdubar Sash",
		-- feet="Inspirited Boots"
	}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.

	sets.ConserveMP = {
		-- main="Sucellus",
		--sub="Thuellaic Ecu +1",
		head="Vanya Hood",
		--body="Vedic Coat",
		hands="Shrieker's Cuffs",
		legs="Vanya Slops",
		feet="Kaykaus Boots +1",
		ear1="Mendi. Earring",
		waist="Austerity Belt",
		back="Solemnity Cape",
	}

	sets.midcast.Teleport = sets.ConserveMP

	-- Gear for Magic Burst mode.
	sets.MagicBurst = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}

	sets.midcast.FastRecast = {
		main=gear.grioavolr_fc_staff,
		sub="Clerisy Strap",
		ammo="Hasty Pinion +1",
		head="Bunzi's Hat",
		neck="Voltsurge Torque",
		ear1="Loquacious Earring",
		ear2="Malignance Earring",
		body="Inyanga Jubbah +2",
		hands="Gende. Gages +1",
		ring1="Kishar Ring",
		-- ring2="Prolix Ring",
		-- back="Swith Cape +1",
		waist="Wiltful Belt",
		-- legs="Lengo Pants",
		feet="Regal Pumps +1"
	}

	-- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast

	sets.midcast.Cure = {
		main="Queller Rod", --15(+2)/(-15)
		sub="Sors Shield", --3/(-5)
		ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1", --18/(-8)
		body="Theo. Bliaut +3",
		hands="Theophany Mitts +3", --(+4)/(-7)
		legs="Ebers Pant. +1",
		feet="Kaykaus Boots +1",
		neck="Cleric's Torque",
		ring1="Lebeche Ring",
		ring2="Tamas Ring",
		ear1="Nourish. Earring +1", -- (+2)/(-5)
		ear2="Glorious Earring",
		back=gear.mnd_jse_back,
		waist="Sacro Cord",
	}

	sets.midcast.CureSolace = {
		main="Queller Rod", --15(+2)/(-15)
		sub="Sors Shield", --3/(-5)
		ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1", --18/(-8)
		body="Ebers Bliaut +1",
		hands="Theophany Mitts +3", --(+4)/(-7)
		legs="Ebers Pant. +1",
		feet="Kaykaus Boots +1",
		neck="Cleric's Torque",
		ear1="Nourish. Earring +1", -- (+2)/(-5)
		ear2="Glorious Earring",
		ring1="Lebeche Ring", --3/(-5)
		ring2="Tamas Ring",
		back=gear.mnd_jse_back,
		waist="Sacro Cord"
	}

	sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {main="Iridal Staff",sub="Enki Strap",back="Twilight Cape",waist="Hachirin-no-Obi"})

	sets.midcast.LightWeatherCureSolace = set_combine(sets.midcast.CureSolace, {main="Iridal Staff",sub="Enki Strap",back="Twilight Cape",waist="Hachirin-no-Obi"})

	sets.midcast.LightDayCureSolace = set_combine(sets.midcast.CureSolace, {back="Twilight Cape",waist="Hachirin-no-Obi"})

	sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {back="Twilight Cape",waist="Hachirin-no-Obi"})

	sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})

	sets.midcast.LightWeatherCuraga = set_combine(sets.midcast.Cure, {main="Iridal Staff",sub="Enki Strap",back="Twilight Cape",waist="Hachirin-no-Obi"})

	sets.midcast.LightDayCuraga = set_combine(sets.midcast.Cure, {back="Twilight Cape",waist="Hachirin-no-Obi"})

	sets.midcast.Cure.DT = {main="Daybreak",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
		head="Bunzi's Hat",neck="Loricate Torque +1",ear1="Nourish. Earring +1",ear2="Glorious Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Lebeche Ring",ring2="Gelatinous Ring +1",
		back=gear.mnd_jse_back,waist="Sacro Cord",legs="Ebers Pant. +1",feet="Bunzi's Sabots"}

	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {
		ammo="Pemphredo Tathlum",
		head="Gende. Caubeen +1", --18/(-8)
		body="Theo. B1iaut +2",
		hands="Theophany Mitts +3", --(+4)/(-7)
		legs="Ebers Pant. +1",
		-- feet="Piety Duckbills +1", --10/(-5)
		feet="Kaykaus Boots +1",
		neck="Incanter's Torque",
		ear1="Nourish. Earring +1", -- (+2)/(-5)
		ear2="Glorious Earring",
		ring1="Lebeche Ring", --3/(-5)
		ring2={name="Ephedra Ring", bag="wardrobe2"},
		back=gear.mnd_jse_back,
		waist="Sacro Cord",
	}

	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})

	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {
		main="Gada",
		sub="Genbu's Shield",
		head="Vanya Hood",
		body="Ebers Bliaut +1",
		hands="Fanatic Gloves", --15
		legs="Th. Pantaloons +2", --17
		feet="Vanya Clogs", --5
		neck="Malison Medallion", --10
		-- ear1="Beatific Earring",
		ear2="Meili Earring",
		ring1={name="Ephedra Ring", bag="wardrobe1"},
		ring2={name="Ephedra Ring", bag="wardrobe2"},
		back=gear.fc_jse_cape, --25
		waist="Bishop's Sash",
	}

	sets.midcast.StatusRemoval = {
		main="Gada",
		sub="Genbu's Shield",
		head="Ebers Cap +1",
		body="Inyanga Jubbah +2",
		hands="Gende' Gages +1",
		legs="Aya. Cosciales +2",
		feet="Regal Pumps +1",
		neck="Voltsurge Torque",
		ear1="Loquacious Earring",
		-- ear2="Etiolation Earring",
		ring1={name="Ephedra Ring", bag="wardrobe1"},
		ring2={name="Ephedra Ring", bag="wardrobe2"},
		back="Mending Cape",
		waist="Embla Sash",
	}

	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Cleric's Torque"})

	-- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {
		main="Gada",
		sub="Ammurapi Shield",
		head=gear.telchine_enh_head,
		body=gear.telchine_enh_body,
		hands=gear.telchine_enh_hands,
		legs=gear.telchine_enh_legs,
		feet="Theo. Duckbills +3",
		neck="Incanter's Torque",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		ring1="Stikini Ring",
		-- ring2={name="Stikini Ring", bag="wardrobe4"},
		-- back="Fi Follet Cape +1",
		waist="Embla Sash",
	}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod",
		sub="Ammurapi Shield",
		-- hands="Regal Cuffs",
		-- waist="Emphatikos Rope",
		-- legs="Shedir Seraweels"
		head="Chironic Hat"
	})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
		main="Bolelabunga",
		head="Inyanga Tiara +2",
		body="Piety Bliaut +3",
		hands="Ebers Mitts +1",
		legs="Th. Pantaloons +2"
	})

	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
		ring2="Sheltered Ring",
		feet="Theo. Duckbills +3",
		-- ear1="Gifted Earring",
		-- waist="Sekhmet Corset"
	})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {
		ring2="Sheltered Ring",
		feet="Theo. Duckbills +3",
		-- ear1="Gifted Earring",
		-- waist="Sekhmet Corset"
	})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
		ring2="Sheltered Ring",
		-- ear1="Gifted Earring",
		-- waist="Sekhmet Corset"
	})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {
		ring2="Sheltered Ring",
		-- ear1="Gifted Earring",
		-- waist="Sekhmet Corset"
	})

	sets.midcast.BarElement = {
		main="Gada", --main="Beneficus",
		sub="Ammurapi Shield",
		ammo="Hasty Pinion +1",
		head="Ebers Cap +1",
		neck="Incanter's Torque",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		body="Ebers Bliaut +1",
		hands="Ebers Mitts +1",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		back=gear.mnd_jse_back,
		waist="Olympus Sash",
		legs="Piety Pantaloons",
		feet="Ebers Duckbills +1"
	}

	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Theophany Mitts +3",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.mnd_jse_back,waist="Sacro Cord",legs="Chironic Hose",feet="Theo. Duckbills +3"}

	sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="C. Palug Crown",neck="Baetyl Pendant",ear1="Gwati Earring",ear2="Friomisi Earring",
		body="Witching Robe",hands="Theophany Mitts +3",ring1="Shiva Ring +1",ring2="Freke Ring",
		back=gear.mnd_jse_back,waist="Sacro Cord",legs="Chironic Hose",feet="Theo. Duckbills +3"}

	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Crematio Earring",
		body="Witching Robe",hands="Theophany Mitts +3",ring1="Metamor. Ring +1",ring2="Freke Ring",
		back=gear.mnd_jse_back,waist="Yamabuki-no-Obi",legs="Chironic Hose",feet="Theo. Duckbills +3"}

	sets.midcast['Divine Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="C. Palug Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.mnd_jse_back,waist="Sacro Cord",legs="Chironic Hose",feet="Theo. Duckbills +3"}

	sets.midcast.Holy = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="C. Palug Crown",neck="Baetyl Pendant",ear1="Gwati Earring",ear2="Friomisi Earring",
		body="Witching Robe",hands="Theophany Mitts +3",ring1="Metamor. Ring +1",ring2="Freke Ring",
		back=gear.mnd_jse_back,waist="Sacro Cord",legs="Gyve Trousers",feet="Theo. Duckbills +3"}

	sets.midcast['Dark Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Theo. Bliaut +3",hands="Theophany Mitts +3",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.mnd_jse_back,waist="Sacro Cord",legs="Chironic Hose",feet="Theo. Duckbills +3"}

	sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Theo. Bliaut +3",hands="Theophany Mitts +3",ring1="Evanescence Ring",ring2="Archon Ring",
		back=gear.mnd_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet="Theo. Duckbills +3"}

	sets.midcast.Drain.Resistant = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Chironic Doublet",hands="Theophany Mitts +3",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.mnd_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet="Theo. Duckbills +3"}

	sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Stikini Ring",
		back=gear.mnd_jse_back,waist="Embla Sash",legs="Lengo Pants",feet="Regal Pumps +1"}

	sets.midcast.Stun.Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Nahtirah Hat",neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.mnd_jse_back,waist="Sacro Cord",legs="Chironic Hose",feet="Theo. Duckbills +3"}

	sets.midcast.Dispel = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Nahtirah Hat",neck="Erra Pendant",ear1="Gwati Earring",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=gear.mnd_jse_back,waist="Sacro Cord",legs="Chironic Hose",feet="Theo. Duckbills +3"}

	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})

	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",
		neck="Erra Pendant",
		ear1="Vor Earring",
		ear2="Malignance Earring",
		body="Theo. Bliaut +3",
		hands="Theophany Mitts +3",
		ring1="Metamor. Ring +1",
		ring2="Stikini Ring",
		back=gear.mnd_jse_back,
		waist="Sacro Cord",
		legs="Chironic Hose",
		feet="Theo. Duckbills +3"
	}

	sets.midcast['Enfeebling Magic'].Resistant = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",
		neck="Erra Pendant",
		ear1="Vor Earring",
		ear2="Malignance Earring",
		body="Theo. Bliaut +3",
		hands="Theophany Mitts +3",
		ring1="Metamor. Ring +1",
		ring2="Stikini Ring",
		back=gear.mnd_jse_back,
		waist="Sacro Cord",
		legs="Chironic Hose",
		feet="Theo. Duckbills +3"
	}

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

	sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Sacro Cord"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Sacro Cord"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.mnd_jse_back,})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.mnd_jse_back,})

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {
		main="Iridal Staff",
		--waist="Shinjutsu-no-Obi +1",
	}

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
		ammo="Homiliary",
		main="Daybreak",
		sub="Genbu's Shield",
		head="Inyanga Tiara +2",
		body="Theo. Bliaut +3",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet="Inyan. Crackows +2",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Eabani Earring",
		ring1="Inyanga Ring",
		ring2="Gelatinous Ring +1",
		back=gear.mnd_jse_back,
		waist="Carrier's Sash",
	}

	sets.idle.PDT = {main="Daybreak",sub="Genbu's Shield",ammo="Homiliary",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Eabani Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Inyanga Ring",ring2="Gelatinous Ring +1",
		back=gear.mnd_jse_back,waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.idle.MDT = {main="Daybreak",sub="Genbu's Shield",ammo="Homiliary",
		head="Bunzi's Hat",neck="Warder's Charm +1",ear1="Moonshade Earring",ear2="Etiolation Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Inyanga Ring",ring2="Gelatinous Ring +1",
		back=gear.mnd_jse_back,waist="Carrier's Sash",legs="Bunzi's Pants",feet="Bunzi's Sabots"}

	sets.idle.Weak = {main="Daybreak",sub="Genbu's Shield",ammo="Homiliary",
		head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Eabani Earring",
		body="Theo. Bliaut +3",hands="Inyan. Dastanas +2",ring1="Inyanga Ring",ring2="Gelatinous Ring +1",
		back=gear.mnd_jse_back,waist="Carrier's Sash",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

	-- Defense sets

	sets.defense.PDT = {main="Daybreak",sub="Genbu's Shield",ammo="Homiliary",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Eabani Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Inyanga Ring",ring2="Gelatinous Ring +1",
		back=gear.mnd_jse_back,waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MDT = {main="Daybreak",sub="Genbu's Shield",ammo="Homiliary",
		head="Bunzi's Hat",neck="Warder's Charm +1",ear1="Moonshade Earring",ear2="Etiolation Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Inyanga Ring",ring2="Gelatinous Ring +1",
		back=gear.mnd_jse_back,waist="Carrier's Sash",legs="Bunzi's Pants",feet="Bunzi's Sabots"}

	sets.defense.MEVA = {main="Daybreak",sub="Genbu's Shield",ammo="Homiliary",
		head="Bunzi's Hat",neck="Warder's Charm +1",ear1="Moonshade Earring",ear2="Eabani Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Inyanga Ring",ring2="Purity Ring",
		back=gear.mnd_jse_back,waist="Carrier's Sash",legs="Bunzi's Pants",feet="Bunzi's Sabots"}

		-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Basic set for if no TP weapon is defined.
	sets.engaged = {
		ammo="Staunch Tathlum +1",
		head="Aya. Zucchetto +1",
		neck="Asperity Necklace",
		ear1="Cessance Earring",
		ear2="Brutal Earring",
		body="Ayanmo Corazza +1",
		hands="Bunzi's Gloves",
		ring1="Petrov Ring",
		ring2="Ilabrat Ring",
		back="Kayapa Cape",
		waist="Kentarch Belt",
		legs="Aya. Cosciales +2",
		feet="Battlecast Gaiters"
	}

	sets.engaged.Acc = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Petrov Ring",Ring2="Ilabrat Ring",
		back="Kayapa Cape",waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.engaged.DW = {ammo="Staunch Tathlum +1",
		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Telos Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Petrov Ring",Ring2="Ilabrat Ring",
		back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}

	sets.engaged.DW.Acc = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Petrov Ring",Ring2="Ilabrat Ring",
		back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}

	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}

	sets.HPCure = {main="Queller Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Blistering Sallet +1",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Moonshade Earring",
		body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Alaunus's Cape",waist="Eschan Stone",legs="Ebers Pant. +1",feet="Kaykaus Boots"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 3)
end

function user_job_lockstyle()
	if player.sub_job == 'SCH' or player.sub_job == 'BLM' then
		if player.equipment.main == nil or player.equipment.main == 'empty' then
			windower.chat.input('/lockstyleset 1')
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
				windower.chat.input('/lockstyleset 1')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
				windower.chat.input('/lockstyleset 1')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Sword/Club.
				windower.chat.input('/lockstyleset 1')
			else
				windower.chat.input('/lockstyleset 1') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
				windower.chat.input('/lockstyleset 1')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
				windower.chat.input('/lockstyleset 1')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Dagger/Club.
				windower.chat.input('/lockstyleset 1')
			else
				windower.chat.input('/lockstyleset 1') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Club/Sword.
				windower.chat.input('/lockstyleset 1')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Club/Dagger.
				windower.chat.input('/lockstyleset 1')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Club/Club.
				windower.chat.input('/lockstyleset 1')
			else
				windower.chat.input('/lockstyleset 1') --Catchall
			end
		end
	elseif player.sub_job == 'WHM' or state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
		windower.chat.input('/lockstyleset 1')
	elseif player.sub_job == 'BLM' or state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
		windower.chat.input('/lockstyleset 1')
	else
		windower.chat.input('/lockstyleset 1')
	end
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	When='Always'},
		{Name='Haste',			Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Always'},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		When='Always'},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	When='Always'},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	When='Always'},
	},
	AutoDyna = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	When='Always'},
		{Name='Haste',			Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Always'},
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		When='Combat'},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	When='Always'},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		When='Always'},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	When='Always'},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	When='Always'},
	},
	Default = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',		SpellID=106,	Reapply=false},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Barthundra',		Buff='Barthunder',	SpellID=70,		Reapply=false},
		{Name='Baramnesra',		Buff='Baramnesia',	SpellID=85,		Reapply=false},
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		Reapply=false},
	},
	Odyssey = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Barthundra',		Buff='Barthunder',	SpellID=70,		Reapply=false},
		{Name='Barparalyzra',	Buff='Barparalyze',	SpellID=88,		Reapply=false},
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		Reapply=false},
	},
	Melee = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		Reapply=false},
	},
	Lilith = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Regen IV',		Buff='Regen',		SpellID=477,	Reapply=false},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=true},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=true},
		{Name='Barfira',		Buff='Barfire',		SpellID=66,		Reapply=true},
		{Name='Baramnesra',		Buff='Baramnesia',	SpellID=85,		Reapply=true},
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		Reapply=false},
	},
	Levi = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Barwatera',		Buff='Barwater',	SpellID=71,		Reapply=false},
		{Name='Barpoisonra',	Buff='Barpoison',	SpellID=87,		Reapply=false},
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		Reapply=false},
	},
}

function handle_smartcure(cmdParams)
	if cmdParams[2] then
		if tonumber(cmdParams[2]) then
			cureTarget = windower.ffxi.get_mob_by_id(tonumber(cmdParams[2]))
		else
			cureTarget = table.concat(cmdParams, ' ', 2)
			cureTarget = get_closest_mob_by_name(cureTarget) 
			if not cureTarget.name then cureTarget = player.target end
			if not cureTarget.name then cureTarget = player end
		end
	elseif player.target.type == "SELF" or player.target.type == 'MONSTER' or player.target.type == 'NONE' then
		cureTarget = player
	else
		cureTarget = player.target
	end

	if cureTarget.status == 2 or cureTarget.status == 3 then
		windower.chat.input('/ma "Arise" '..cureTarget..'')
		return
	end
	
	local missingHP
	local spell_recasts = windower.ffxi.get_spell_recasts()

	if cureTarget.type == 'MONSTER' then
		if silent_can_use(4) and spell_recasts[4] < spell_latency then
			windower.chat.input('/ma "Cure IV" '..cureTarget.id..'')
		elseif spell_recasts[3] < spell_latency then
			windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
		elseif spell_recasts[2] < spell_latency then
			windower.chat.input('/ma "Cure II" '..cureTarget.id..'')
		else
			add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
		end
	elseif cureTarget.in_alliance then
		cureTarget.hp = find_player_in_alliance(cureTarget.name).hp
		local est_max_hp = cureTarget.hp / (cureTarget.hpp/100)
		missingHP = math.floor(est_max_hp - cureTarget.hp)
	else
		local est_current_hp = 1800 * (cureTarget.hpp/100)
		missingHP = math.floor(1800 - est_current_hp)
	end

	if missingHP < 250 then
		if spell_recasts[1] < spell_latency then
			windower.chat.input('/ma "Cure" '..cureTarget.id..'')
		elseif spell_recasts[2] < spell_latency then
			windower.chat.input('/ma "Cure II" '..cureTarget.id..'')
		else
			add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
		end
	elseif missingHP < 400 then
		if spell_recasts[2] < spell_latency then
			windower.chat.input('/ma "Cure II" '..cureTarget.id..'')
		elseif spell_recasts[3] < spell_latency then
			windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
		elseif spell_recasts[1] < spell_latency then
			windower.chat.input('/ma "Cure" '..cureTarget.id..'')
		else
			add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
		end
	elseif missingHP < 900 then
		if spell_recasts[3] < spell_latency then
			windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
		elseif spell_recasts[4] < spell_latency then
			windower.chat.input('/ma "Cure IV" '..cureTarget.id..'')
		elseif spell_recasts[5] < spell_latency then
			windower.chat.input('/ma "Cure V" '..cureTarget.id..'')
		else
			add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
		end
	elseif missingHP < 1400 then
		if spell_recasts[4] < spell_latency then
			windower.chat.input('/ma "Cure IV" '..cureTarget.id..'')
		elseif spell_recasts[5] < spell_latency then
			windower.chat.input('/ma "Cure V" '..cureTarget.id..'')
		elseif spell_recasts[6] < spell_latency then
			windower.chat.input('/ma "Cure VI" '..cureTarget.id..'')
		elseif spell_recasts[3] < spell_latency then
			windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
		else
			add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
		end
	else
		if spell_recasts[5] < spell_latency then
			windower.chat.input('/ma "Cure V" '..cureTarget.id..'')
		elseif spell_recasts[6] < spell_latency then
			windower.chat.input('/ma "Cure VI" '..cureTarget.id..'')
		elseif spell_recasts[4] < spell_latency then
			windower.chat.input('/ma "Cure IV" '..cureTarget.id..'')
		elseif spell_recasts[3] < spell_latency then
			windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
		else
			add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
		end
	end
end
