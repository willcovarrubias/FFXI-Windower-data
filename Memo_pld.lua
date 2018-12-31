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

include('Memo-Include.lua')

send_command('alias rag input /equip main "Ragnarok";' )
send_command('alias aeg input /equip main "Burtgang"; input /equip sub "Aegis";' )
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
	ammo="Sapience orb", head="Carmine mask", neck="Baetyl Pendant",
	hands="Leyline gloves",ear1="Etiolation Earring",ear2="Odnowa earring +1", legs="Eschite cuisses", feet=gear.odysseanGreaves_FC}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {ear1="Nourishing earring +1"})

   
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
			back="Reiki Cloak",
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
			hands="Caballarius gauntlets +2",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Reiki Cloak",
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
			hands="Caballarius gauntlets +2",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Reiki Cloak",
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
			hands="Caballarius gauntlets +2",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Reiki Cloak",
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
			hands="Caballarius gauntlets +2",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Reiki Cloak",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"
		}

	sets.precast.JA['Fealty'] = 
		{
			head="Souveran schaller +1",
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Caballarius gauntlets +2",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Reiki Cloak",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"
		}

	sets.precast.JA['Palisade'] = 
		{
			head="Souveran schaller +1", 
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Caballarius gauntlets +2",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Reiki Cloak",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"
		}

	sets.precast.JA['Invincible'] = 
		{
			head="Souveran schaller +1", 
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Caballarius gauntlets +2",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Reiki Cloak",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"
		}

	sets.precast.JA['Intervene'] = 
		{
			head="Souveran schaller +1",
			neck="Unmoving collar +1", 
			ear1="Cryptic earring",
			ear2="Pluto's pearl",
			body="Reverence surcoat +2",
			hands="Caballarius gauntlets +2",
			ring1="Eihwaz ring",
			ring2="Petrov ring",
			back="Reiki Cloak",
			waist="Goading belt",
			legs="Souveran diechlings +1",
			feet="Souveran Schuhs +1"
		}


        
    sets.precast.WS['Chant du Cygne'] = {ammo="Jukukik feather",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Domin. earring +1",ear2="Brutal Earring",
        body="Sulevia's platemail +2",hands="Flamma manopolas +2",ring1="Regal ring",ring2="Begrudging Ring",
        back=gear.Rudianos_STP,waist="Fotia Belt",legs="Sulevia's cuisses +2",feet="Sulevia's leggings +2"}
    
	sets.precast.WS['Resolution'] = {ammo="Amar cluster",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Brutal Earring",
        body="Sulevia's platemail +2",hands="Sulevia's gauntlets +2",ring1="Regal ring",ring2="Rufescent Ring",
        back=gear.Rudianos_STP,waist="Fotia Belt",legs="Sulevia's cuisses +2",feet="Sulevia's leggings +2"}
    
	sets.precast.WS['Requiescat'] = {ammo="Amar cluster",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Brutal Earring",
        body="Sulevia's platemail +2",hands="Sulevia's gauntlets +2",ring1="Regal ring",ring2="Rufescent ring",
        back=gear.Rudianos_STP,waist="Fotia Belt",legs="Sulevia's cuisses +2",feet="Sulevia's leggings +2"}

	sets.precast.WS['Savage Blade'] = {ammo="Floestone",
        head=gear.odysseanHelm_WSD,neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara Earring",
        body="Sulevia's platemail +2",hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Rufescent Ring",
        back=gear.Rudianos_WSD,waist="Metalsinger Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}


	sets.precast.WS['Knights of Round'] = {ammo="Amar cluster",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Telos earring",ear2="Dignitary's earring",
        body="Sulevia's platemail +2",hands=gear.odysseanGauntlets_DA,ring1="Cacoethic ring +1",ring2="Rufescent ring",
        back=gear.Rudianos_WSD,waist="Fotia Belt",legs="Sulevia's cuisses +2",feet="Sulevia's leggings +2"}
		
	sets.precast.WS['Atonement'] = {
        neck="Fotia gorget",ear2="Moonshade earring",waist="Fotia belt"}

	sets.precast.WS['Scourge'] = {ammo="Floestone",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Odnowa earring +1",ear2="Ishvara Earring",
        body="Sulevia's platemail +2",hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Rufescent Ring",
        back=gear.Rudianos_WSD,waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
		
	sets.precast.WS['Sanguine Blade'] = {ammo="Floestone",
        head="Jumalik helm",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Novio earring",
        body="Founder's breastplate",hands=gear.valorousMitts_MAB,ring1="Shiva Ring +1",ring2="Rufescent ring",
        back=gear.Rudianos_WSD,waist="Yamabuki-no-obi",legs="Eschite cuisses",feet="Founder's greaves"}
		
	sets.precast.WS['Circle Blade'] = {ammo="Amar cluster",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Telos earring",ear2="Dignitary's earring",
        body="Sulevia's platemail +2",hands=gear.odysseanGauntlets_DA,ring1="Cacoethic ring +1",ring2="Rufescent ring",
        back=gear.Rudianos_STP,waist="Fotia Belt",legs="Sulevia's cuisses +2",feet="Sulevia's leggings +2"}

	
	sets.precast.WS['Torcleaver'] = {ammo="Floestone",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Odnowa earring +1",ear2="Ishvara Earring",
        body="Sulevia's platemail +2",hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Rufescent Ring",
        back=gear.Rudianos_WSD,waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
		
    -- Midcast Sets
    
    sets.midcast.FastRecast = {ammo="Sapience orb",
		neck="Unmoving collar +1",ear1="Cryptic earring",ring2="Eihwaz Ring",
		back="Reiki Cloak",waist="Goading Belt"}
   
	--sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {ear1="Nourishing earring +1",body="Jumalik mail", back="Solemnity cape", 
	--neck="Diemer gorget",hands="Souveran handschuhs +1", legs="Souveran diechlings +1",feet="Souveran Schuhs +1", ring1="Meridian ring"})

	---Omen Midcast---
	sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {ear1="Nourishing earring +1",body="Jumalik mail", back="Moonbeam Cape", 
	neck="Diemer gorget",hands="Souveran handschuhs +1", legs="Souveran diechlings +1",feet="Souveran Schuhs +1", ring1="Meridian ring"})
	
	sets.midcast.Enlight = set_combine(sets.midcast.FastRecast, {neck="Incanter's torque", body="Reverence surcoat +2", hands="Eschite gauntlets", waist="Channeler's stone"})
	sets.midcast['Enlight II'] = sets.midcast.Enlight
	
	sets.midcast.Crusade = set_combine(sets.midcast.FastRecast, {head="Carmine mask", neck="Incanter's torque", legs="Carmine cuisses +1",ear1="Andoaa earring", feet="Souveran Schuhs +1", 
	hands="Regal gauntlets", back="Weard mantle"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast.FastRecast, {head="Carmine mask", neck="Incanter's torque", legs="Carmine cuisses +1",ear1="Andoaa earring", feet="Souveran Schuhs +1", 
	hands="Souveran handschuhs +1", back="Weard mantle"})
	
	sets.midcast.Holy = {ammo="Pemphredo tathlum",
        head="Jumalik helm",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Novio earring",
        body="Founder's breastplate",hands=gear.valorousMitts_MAB,ring1="Shiva Ring +1",ring2="Rufescent ring",
        back="Laic mantle",waist="Hachirin-no-obi",legs="Eschite cuisses",feet="Founder's greaves"}

	    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {ammo="Homiliary",
        head="Jumalik helm",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Chozoron coselete",hands="Regal gauntlets",ring1="Vocane ring",ring2="Defending Ring",
        back="Moonbeam cape",waist="Flume belt +1",legs="Carmine cuisses +1",feet="Souveran Schuhs +1"}

    sets.idle.Tank = {ammo="Staunch tathlum",
        head="Souveran schaller +1",neck="Loricate torque +1",ear1="Thureous Earring",ear2="Odnowa earring +1",
        body="Souveran cuirass +1",hands="Souveran handschuhs +1",ring1="Vocane ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Souveran diechlings +1",feet="Souveran Schuhs +1"}

    sets.Kiting = {legs="Carmine cuisses +1"}
		
	sets.engaged.STP = {ammo="Ginsen", 
		head="Flamma zucchetto +2",neck="Asperity necklace",ear1="Telos earring",ear2="Brutal Earring",
		body=gear.valorousMail_DA,hands="Flamma manopolas +2",ring1="Regal ring",ring2="Petrov Ring",
		back=gear.Rudianos_STP,waist="Sailfi belt +1",legs=gear.odysseanLegs_STP,feet="Flamma gambieras +2"}			

	sets.engaged.Tank = {ammo="Staunch tathlum",
        head="Souveran schaller +1",neck="Loricate torque +1",ear1="Thureous earring",ear2="Odnowa earring +1",
        body="Souveran cuirass +1",hands="Souveran handschuhs +1",ring1="Vocane ring",ring2="Defending Ring",
        back="Moonbeam cape",waist="Flume belt +1",legs="Souveran diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.engaged.Hybrid = {ammo="Amar cluster",
        head="Sulevia's mask +2",neck="Combatant's torque",ear1="Telos earring",ear2="Odnowa earring +1",
        body="Souveran cuirass +1",hands="Sulevia's gauntlets +2",ring1="Vocane ring",ring2="Defending Ring",
        back=gear.Rudianos_STP,waist="Sailfi belt +1",legs="Souveran diechlings +1",feet="Flamma gambieras +2"}
		
	sets.engaged.Acc = {ammo="Amar cluster",
        head="Sulevia's mask +2",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",	
        body=gear.valorousMail_DA,hands="Sulevia's gauntlets +2",ring1="Regal ring",ring2="Cacoethic ring +1",
        back=gear.Rudianos_STP,waist="Sailfi belt +1",legs="Sulevia's cuisses +2",feet="Sulevia's leggings +2"}

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
    set_macro_page(1, 2)
end
