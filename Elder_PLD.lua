	-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

include('Elder-Include.lua')


send_command('alias ae input /equip main "Burtgang"; input /equip sub "Aegis";' )
send_command('alias oc input /equip main "Burtgang"; input /equip sub "Ochain";' )
send_command('alias craftgear input //gs equip sets.crafting')
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('STP', 'Tank', 'Hybrid', 'Acc')
    
	state.IdleMode:options('Idle', 'Tank')
	

    
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {ring1={name="Meridian ring",priority=16}, ring2={name="Eihwaz ring",priority=16},body="Reverence surcoat +2",
	ammo="Sapience orb", head="Carmine mask", neck="Baetyl pendant",
	hands="Leyline gloves",ear1="Loquacious Earring",ear2="Odnowa earring +1", legs="Eschite cuisses", feet=gear.odysseanGreaves_FC}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {body="Jumalik mail",neck="Diemer gorget", ear1="Nourishing earring +1"})

   
    -- Precast sets to enhance JAs
   sets.precast.JA['Provoke'] = 
		{
			head="Loess barbuta +1", 
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Souveran handschuhs +1",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Mubvumbamiri mantle",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"
		}

	sets.precast.JA['Chivalry'] =
		{			
			head="Loess barbuta +1", 
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Caballarius gauntlets +1",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Mubvumbamiri mantle",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"			
		}

	sets.precast.JA['Shield Bash'] = 
		{
			head="Loess barbuta +1", 
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Caballarius gauntlets +1",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Mubvumbamiri mantle",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"
		}

	sets.precast.JA['Sentinel'] = 
		{
			head="Loess barbuta +1",  
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Caballarius gauntlets +1",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Mubvumbamiri mantle",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Caballarius leggings +1"
		}

	sets.precast.JA['Rampart'] = 
		{
			head="Loess barbuta +1",
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Caballarius gauntlets +1",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Mubvumbamiri mantle",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"
		}

	sets.precast.JA['Fealty'] = 
		{
			head="Souveran schaller",
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Caballarius gauntlets +1",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Mubvumbamiri mantle",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"
		}

	sets.precast.JA['Palisade'] = 
		{
			head="Souveran schaller", 
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Caballarius gauntlets +1",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Mubvumbamiri mantle",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"
		}

	sets.precast.JA['Invincible'] = 
		{
			head="Souveran schaller", 
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Caballarius gauntlets +1",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Mubvumbamiri mantle",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"
		}

	sets.precast.JA['Intervene'] = 
		{
			head="Souveran schaller",
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Caballarius gauntlets +1",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Mubvumbamiri mantle",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"
		}


        
    sets.precast.WS['Chant du Cygne'] = {ammo="Jukukik feather",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara Earring",
        body="Sulevia's platemail +2",hands="Flamma manopolas +1",ring1="Begrudging ring",ring2="Apate Ring",
        back="Rudianos's mantle",waist="Fotia Belt",legs=gear.odysseanLegs_WSD,feet="Sulevia's leggings +2"}
    
	sets.precast.WS['Resolution'] = {ammo="Amar cluster",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara Earring",
        body="Sulevia's platemail +2",hands="Sulevia's gauntlets +2",ring1="Rufescent ring",ring2="Shukuyu Ring",
        back="Rudianos's mantle",waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
    
	sets.precast.WS['Requiescat'] = {ammo="Amar cluster",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara Earring",
        body="Sulevia's platemail +2",hands=gear.odysseanGauntlets_WSD,ring1="Rufescent ring",ring2="Ifrit ring +1",
        back="Rudianos's mantle",waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}

	sets.precast.WS['Savage Blade'] = {ammo="White Tathlum",
        head="Valorous mask",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara Earring",
        body="Valorous mail",hands="Valorous Mitts",ring1="Rufescent ring",ring2="Ifrit Ring",
        back="Laic mantle",waist="Fotia Belt",legs={ name="Valor. Hose", augments={'Attack+4','Weapon skill damage +5%','Haste+4','Accuracy+15 Attack+15','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},feet="Sulevia's leggings +2"}
		
	sets.precast.WS['Vorpal Blade'] = {ammo="White Tathlum",
        head="Valorous mask",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara Earring",
        body="Founder's breastplate",hands="Valorous Mitts",ring1="Rajas ring",ring2="Ifrit Ring",
        back="Laic mantle",waist="Fotia Belt",legs="Valorous Hose",feet="Valorous greaves"}

	sets.precast.WS['Knights of Round'] = {ammo="Amar cluster",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Telos earring",ear2="Zennaroi earring",
        body="Sulevia's platemail +2",hands=gear.odysseanGauntlets_DA,ring1="Rufescent ring",ring2="Cacoethic ring +1",
        back="Rudianos's mantle",waist="Fotia Belt",legs=gear.odysseanLegs_WSD,feet="Sulevia's leggings +2"}
		
	sets.precast.WS['Atonement'] = {
        body=gear.odysseanChest_WSD,head=gear.odysseanHelm_WSD,neck="Fotia gorget",ear1="Ishvara earring",ear2="Moonshade earring",
        hands=gear.odysseanGauntlets_WSD,waist="Fotia belt",legs=gear.valorousHose_WSD, feet="Sulevia's leggings +2"}

	sets.precast.WS['Scourge'] = {ammo="Floestone",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Odnowa earring +1",ear2="Ishvara Earring",
        body="Sulevia's platemail +2",hands=gear.odysseanGauntlets_WSD,ring1="Rufescent ring",ring2="Shukuyu Ring",
        back="Laic mantle",waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
		
	sets.precast.WS['Sanguine Blade'] = {ammo="Floestone",
        head="Jumalik helm",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Novio earring",
        body="Founder's breastplate",hands=gear.valorousMitts_MAB,ring1="Shiva Ring +1",ring2="Rufescent ring",
        back="Laic mantle",waist="Yamabuki-no-obi",legs=gear.odysseanLegs_MAB,feet="Founder's greaves"}
		
	sets.precast.WS['Circle Blade'] = {ammo="Amar cluster",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Telos earring",ear2="Zennaroi earring",
        body="Sulevia's platemail +2",hands=gear.odysseanGauntlets_DA,ring1="Rufescent ring",ring2="Cacoethic ring +1",
        back="Rudianos's mantle",waist="Fotia Belt",legs=gear.odysseanLegs_WSD,feet="Sulevia's leggings +2"}

	
	sets.precast.WS['Torcleaver'] = {ammo="Floestone",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Odnowa earring +1",ear2="Ishvara Earring",
        body="Sulevia's platemail +2",hands=gear.odysseanGauntlets_WSD,ring1="Rufescent ring",ring2="Shukuyu Ring",
        back="Laic mantle",waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
		
    -- Midcast Sets
    
    sets.midcast.FastRecast = {ammo="Sapience orb",
		neck="Unmoving collar +1",ear1="Cryptic earring",ring2="Eihwaz Ring",
		back="Mubvumbamiri mantle",waist="Goading Belt"}
   
	--sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {ear1="Nourishing earring +1",body="Jumalik mail", back="Solemnity cape", 
	--neck="Diemer gorget",hands="Souveran handschuhs +1", legs="Souveran diechlings +1",feet="Souveran Schuhs +1", ring1="Meridian ring"})

	---Omen Midcast---
	sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {ear1="Nourishing earring +1",body="Jumalik mail", back="Xucau mantle", 
	neck="Diemer gorget",hands="Souveran handschuhs +1", legs="Souveran diechlings +1",feet="Souveran Schuhs +1", ring1="Meridian ring", ring2="Eihwaz ring"})
	
	sets.midcast.Enlight = set_combine(sets.midcast.FastRecast, {neck="Incanter's torque", body="Reverence surcoat +2", hands="Eschite gauntlets", waist="Asklepian belt"})
	sets.midcast['Enlight II'] = sets.midcast.Enlight
	
	sets.midcast.Phalanx = set_combine(sets.midcast.FastRecast, {head="Carmine mask", neck="Incanter's torque", legs="Carmine cuisses +1",ear1="Andoaa earring", feet="Souveran Schuhs +1", hands="Souveran handschuhs +1", back="Weard mantle"})
	
	sets.midcast.Holy = {ammo="Pemphredo tathlum",
        head="Jumalik helm",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Novio earring",
        body="Founder's breastplate",hands=gear.valorousMitts_MAB,ring1="Shiva Ring +1",ring2="Rufescent ring",
        back="Laic mantle",waist="Yamabuki-no-obi",legs=gear.valorousHose_MAB,feet="Founder's greaves"}

	    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {ammo="Angha gem",
        head="Odyssean Helm",neck="Sanctity necklace",ear1="Steelflash Earring",ear2="Bladeborn earring",
        body="Jumalik mail",hands="Odyssean gauntlets",ring1="Rajas ring",ring2="Petrov Ring",
        back="Philidor mantle",waist="Nierenschutz",legs="Crimson cuisses",feet="Odyssean greaves"}

    sets.idle.Tank = {ammo="Angha gem",
        head="Souveran schaller",neck="Loricate torque +1",ear1="Thureous Earring",ear2="Odnowa earring +1",
        body="Souveran cuirass",hands="Souveran handschuhs",ring1="Vocane ring",ring2="Defending Ring",
        back="Moonbeam cape",waist="Nierenschutz",legs="Carmine cuisses +1",feet="Souveran Schuhs"}
 
   

    sets.Kiting = {legs="Crimson cuisses"}

   

		
	sets.engaged.STP = {ammo="Angha gem",
        head="Odyssean Helm",neck="Sanctity necklace",ear1="Steelflash Earring",ear2="Bladeborn earring",
        body="Souveran Cuirass",hands="Odyssean Guantlets",ring1="Rajas ring",ring2="Petrov Ring",
        back="Philidor mantle",waist="Goading Belt",legs="Odyssean cuisses",feet="Odyssean greaves"}			

	sets.engaged.Tank = {ammo="Angha gem",
        head="Souveran schaller",neck="Twilight torque",ear1="Thureous Earring",ear2="Colossus's earring",
        body="Souveran cuirass",hands="Souveran handschuhs",ring1="Vocane ring",ring2="Defending Ring",
        back="Moonbeam cape",waist="Nierenschutz",legs="Souveran diechlings",feet="Souveran Schuhs"}
		
	sets.engaged.Hybrid = {main="Sequence",sub="Ochain",
    ammo="Angha Gem",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body={ name="Souveran Cuirass", augments={'HP+50','STR+10','Accuracy+10',}},
    hands={ name="Odyssean Gauntlets", augments={'Accuracy+21 Attack+21','"Dbl.Atk."+3','STR+15','Attack+11',}},
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Loricate Torque +1",
    waist="Sailfi Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Brutal Earring",
    left_ring="Vocane Ring",
    right_ring="Petrov Ring",
    back={ name="Weard Mantle", augments={'VIT+3','Enmity+5','Phalanx +2',}}
	}
		
	sets.engaged.Acc = {ammo="Amar cluster",
        head=gear.valorousMask_STP,neck="Combatant's torque",ear1="Telos earring",ear2="Zennaroi earring",	
        body=gear.valorousMail_DA,hands="Sulevia's gauntlets +2",ring1="Cacoethic ring",ring2="Cacoethic ring +1",
        back="Rudianos's mantle",waist="Tempus fugit",legs="Sulevia's cuisses +2",feet="Sulevia's leggings +2"}



end


function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 8)
end
