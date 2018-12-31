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

include('Nimla-Include.lua')

send_command('alias tank input /equip main "Epeolatry"; input /equip sub "Utu grip";' )
send_command('alias dps input /equip main "Lionheart"; input /equip sub "Utu grip";' )
send_command('alias craftgear input //gs equip sets.crafting')
send_command('alias ohshit input /equip body "Futhark coat +1"; input /equip neck "Loricate torque +1"; input /equip ring1 "Moonbeam Ring"; input /equip legs "Ayanmo cosciales +2"; input /equip ring2 "Defending ring";')

    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('STP', 'Acc',  'Tank', 'Hybrid')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle', 'Tank', 'Refresh')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')

    
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience orb", head="Carmine mask", neck="Baetyl Pendant",hands="Leyline gloves", ring1="Prolix ring", ring2="Kishar ring",
	ear1="Etiolation Earring",ear2="Enchanter earring +1", legs="Ayanmo cosciales +2"}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark trousers +1", waist="Siegel Sash"})
    
    -- Precast sets to enhance JAs
   sets.precast.JA['Provoke'] = 
		{
			neck="Unmoving collar +1", ear1="Cryptic earring",ear2="Pluto's pearl",
			ring1="Eihwaz ring",ring2="Petrov ring",
			back="Reiki Cloak",	waist="Goading belt",legs="Erilaz leg guards +1",feet="Erilaz greaves +1"
		}
		
	sets.precast.JA['Vallation'] = 
		{
			body="Runeist coat +1"
		}
		
	sets.precast.JA['Swordplay'] = 
		{
			hands="Futhark mitons"
		}
		
	sets.precast.JA['Swipe'] =
		{
			ammo="Pemphredo tathlum", head=gear.herculeanHelm_TA,neck="Sanctity necklace", ear1="Friomisi earring", ear2="Novio earring",
			body="Samnuha coat", hands="Leyline gloves", back="Evasionist's cape", waist="Yamabuki-no-obi", legs="Ayanmo cosciales +2", feet=gear.herculeanBoots_TA
		}
	
	sets.precast.JA['Lunge'] = 
		{
			ammo="Pemphredo tathlum", head=gear.herculeanHelm_TA,neck="Sanctity necklace", ear1="Friomisi earring", ear2="Novio earring",
			body="Samnuha coat", hands="Leyline gloves", back="Evasionist's cape", waist="Yamabuki-no-obi", legs="Ayanmo cosciales +2", feet=gear.herculeanBoots_TA
		}
		
	sets.precast.JA['Pflug'] = 
		{
			feet="Runeist bottes +1"
		}
		
	sets.precast.JA['Valiance'] = 
		{
			body="Runeist coat +1"
		}
		
	sets.precast.JA['Embolden'] = 
		{
			back="Evasionist's cape"
		}
	
	sets.precast.JA['Vivacious Pulse'] = 
		{
			head="Erilaz galea +1"
		}

	sets.precast.JA['Gambit'] = 
		{
			hands="Runeist's mitons +1"
		}
		
	sets.precast.JA['Battuta'] = 
		{
			head="Futhark bandeau +1"
		}	
		
	sets.precast.JA['Rayke'] = 
		{
			feet="Futhark boots +1"
		}
		
	sets.precast.JA['One for All'] = {}
		
	sets.precast.JA['Elemental Sforzo'] = 
		{
			body="Futhark coat +1"
		}
		
	sets.precast.JA['Odyllic Subterfuge'] = {}
		
    -- Waltz set (chr and vit)
  --  sets.precast.Waltz = {}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
   -- gear.default.weaponskill_neck = "Asperity Necklace"
    --gear.default.weaponskill_waist = ""
        
      
	--[[sets.precast.WS['Resolution'] = {ammo="Seething bomblet +1",
        head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Sherida earring",
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.OgmasCape_DA,waist="Fotia Belt",legs="Samnuha tights",feet=gear.herculeanBoots_TA}]]--
		
	sets.precast.WS['Resolution'] = {ammo="Seething Bomblet +1",
        head=gear.herculeanHelm_TA,neck="Fotia gorget",ear1="Sherida earring",ear2="Moonshade earring",
        body="Adhemar jacket",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.OgmasCape_DA,waist="Fotia Belt",legs="Samnuha tights",feet=gear.herculeanBoots_TA}
		
		
	sets.precast.WS['Spinning Slash'] = {ammo="Seething bomblet +1",
        head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Ishvara earring",ear2="Sherida Earring",
        body="Sulevia's platemail +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.OgmasCape_DA,waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
    
	
	sets.precast.WS['Dimidiation'] = {ammo="Knobkierrie",
        head="Adhemar bonnet +1",neck="Caro necklace",ear1="Ishvara earring",ear2="Moonshade Earring",
        body=gear.herculeanVest_MAB,hands="Meghanada gloves +2",ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.OgmasCape_DA,waist="Fotia Belt",legs=gear.herculeanTrousers_WSD,feet=gear.herculeanBoots_TA}
		
	sets.precast.WS['Savage Blade'] = {ammo="Knobkierrie",
        head="Adhemar bonnet +1",neck="Caro necklace",ear1="Ishvara earring",ear2="Moonshade Earring",
        body=gear.herculeanVest_MAB,hands="Meghanada gloves +2",ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.OgmasCape_DA,waist="Metalsinger Belt",legs=gear.herculeanTrousers_WSD,feet="Meghanada jambeaux +2"}
		
	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo tathlum", head="Pixie Hairpin +1",neck="Sanctity necklace", ear1="Friomisi earring", ear2="Novio earring",
			body="Samnuha coat", hands="Leyline gloves", ring1="Archon Ring", back="Izdubar mantle", waist="Fotia belt", legs=gear.herculeanTrousers_WSD, feet=gear.herculeanBoots_WSD}


    -- Midcast Sets
    
    sets.midcast.FastRecast = {ammo="Sapience orb",
		neck="Unmoving collar +1",ring1="Prolix Ring"}
   
	sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {back="Solemnity cape", hands="Weatherspoon cuffs +1"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast.FastRecast, {head="Futhark bandeau +1", neck="Incanter's torque", ear1="Andoaa earring", 
	hands="Regal gauntlets",legs="Futhark trousers +1", back="Evasionist's cape"})
	
	sets.midcast.Flash = set_combine (sets.midcast.FastRecast, {neck="Unmoving collar +1", ear1="Cryptic earring",ear2="Pluto's pearl",ring1="Eihwaz ring",ring2="Petrov ring",
			back="Reiki Cloak",	waist="Goading belt",legs="Erilaz leg guards +1",feet="Erilaz greaves +1"})
			
	sets.midcast.Regen = set_combine(sets.midcast.FastRecast, {head="Runeist bandeau +1", hands="Regal gauntlets",legs="Futhark trousers +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast.FastRecast, {head="Erilaz galea +1", hands="Regal gauntlets",legs="Futhark trousers +1"})
	
	sets.midcast.Crusade = set_combine(sets.midcast.FastRecast, {head="Erilaz galea +1", hands="Regal gauntlets",legs="Futhark trousers +1"})
	
	sets.midcast.Foil = set_combine(sets.midcast.FastRecast, {head="Erilaz galea +1", hands="Regal gauntlets",legs="Futhark trousers +1"})
	
	sets.midcast.Temper = set_combine(sets.midcast.FastRecast, {head="Erilaz galea +1", hands="Runeist's mitons +1",legs="Futhark trousers +1"})
	
	sets.midcast.Refresh = set_combine(sets.midcast.FastRecast, {head="Erilaz galea +1", hands="Regal gauntlets",legs="Futhark trousers +1"})
	
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {ammo="Staunch tathlum",
        head="Meghanada visor +2",neck="Loricate torque +1",ear1="Etiolation earring",ear2="Odnowa earring +1",
        body="Futhark coat +1",hands="Meghanada gloves +2",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam cape",waist="Flume belt +1",legs="Carmine cuisses +1",feet="Meghanada jambeaux +2"}

    sets.idle.Tank = {ammo="Staunch tathlum",
        head="Futhark bandeau +1",neck="Loricate torque +1",ear1="Etiolation earring",ear2="Odnowa earring +1",
        body="Futhark coat +1",hands="Regal gauntlets",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam cape",waist="Flume belt +1",legs="Erilaz leg guards +1",feet="Erilaz greaves +1"}

	sets.idle.Refresh = {ammo="Homiliary",
        head="Rawhide mask",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Runeist coat +1",hands="Regal gauntlets",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam cape",waist="Flume belt +1",legs="Rawhide trousers",feet=gear.herculeanBoots_Refresh}    

    sets.Kiting = {legs="Carmine cuisses +1"}


    -- Engaged sets

	sets.engaged.STP = {ammo="Seeth. Bomblet +1",
    head="Dampening Tam",
    body="Adhemar jacket",
    hands="Adhemar wristbands",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet=gear.herculeanBoots_TA,
    neck="Anu torque",
    waist="Windbuffet belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back="Moonbeam Cape",}
		
	 sets.engaged.Acc = {ammo="Yamarang",
        head="Adhemar bonnet +1",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Meghanada cuirie +2",hands="Adhemar wristbands +1",ring1="Regal ring",ring2="Cacoethic ring +1",
        back=gear.OgmasCape_DA,waist="Windbuffet belt +1",legs="Ayanmo cosciales +2",feet="Meghanada jambeaux +2"}

	sets.engaged.Tank = {ammo="Staunch tathlum",
        head="Futhark bandeau +1",neck="Warder's charm +1",ear1="Etiolation earring",ear2="Odnowa earring +1",
        body="Futhark coat +1",hands="Kurys gloves",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam cape",waist="Flume belt +1",legs="Erilaz leg guards +1",feet="Erilaz greaves +1"}
		
	sets.engaged.Hybrid = {main="Epeolatry",sub="Utu grip",ammo="Yamarang",
		head="Futhark bandeau +1",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Futhark coat +1",hands="Kurys gloves",ring1="Moonbeam Ring",ring2="Defending Ring",
		back=gear.OgmasCape_DA,waist="Windbuffet Belt +1",legs="Erilaz leg guards +1",feet=gear.herculeanBoots_TA}



    -- Example of Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    --sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
--function job_precast(spell, action, spellMap, eventArgs)
--    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
--        eventArgs.handled = true
--   end
    
--    if spell.skill == 'Healing Magic' then
--       gear.default.obi_back = "Mending Cape"
--    else
--        gear.default.obi_back = "Toro Cape"
--    end
--end


--function job_post_midcast(spell, action, spellMap, eventArgs)
--    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
--    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
--        equip(sets.buff['Divine Caress'])
--    end
--end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
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
    set_macro_page(1, 7)
end
