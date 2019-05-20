DECLARE
	date_action timestamp without time zone;
	v_id integer;

	i_rec_id integer;
	i_createby integer;
	i_createdate timestamp with time zone;
	i_lastupdateby integer;
	i_lastupdatedate timestamp with time zone;
	i_deleteby integer;
	i_deletedate timestamp with time zone;
	i_fname character varying(250) COLLATE pg_catalog."default";
	i_name character varying(250) COLLATE pg_catalog."default";
	i_oname character varying(250) COLLATE pg_catalog."default";
	i_birthday date;
	i_doc_id integer;
	i_doc_serial character varying(10) COLLATE pg_catalog."default";
	i_doc_number character varying(25) COLLATE pg_catalog."default";
	i_snils character varying(14) COLLATE pg_catalog."default";
	i_counter_1 integer;
	i_city_1 integer;
	i_street_1 integer;
	i_house_1 character varying(10) COLLATE pg_catalog."default";
	i_building_1 character varying(10) COLLATE pg_catalog."default";
	i_flat_1 character varying(10) COLLATE pg_catalog."default";
	i_counter_2 integer;
	i_city_2 integer;
	i_street_2 integer;
	i_house_2 character varying(10) COLLATE pg_catalog."default";
	i_building_2 character varying(10) COLLATE pg_catalog."default";
	i_flat_2 character varying(10) COLLATE pg_catalog."default";
	
BEGIN
	
	IF TG_OP = 'UPDATE' THEN
		date_action = now();
		i_rec_id = OLD.id;
		i_createby = OLD.createby;
		i_createdate = OLD.createdate ;
		i_lastupdateby = OLD.lastupdateby ;
		i_lastupdatedate = OLD.lastupdatedate ;
		i_deleteby = OLD.deleteby ;
		i_deletedate = OLD.deletedate ;
		i_fname = OLD.fname ;
		i_name = OLD.name ;
		i_oname = OLD.oname ;
		i_birthday = OLD.birthday ;
		i_doc_id = OLD.doc_id ;
		i_doc_serial = OLD.doc_serial ;
		i_doc_number = OLD.doc_number ;
		i_snils = OLD.snils ;
		i_counter_1 = OLD.counter_1 ;
		i_city_1 = OLD.city_1 ;
		i_street_1 = OLD.street_1 ;
		i_house_1 = OLD.house_1 ;
		i_building_1 = OLD.building_1 ;
		i_flat_1 = OLD.flat_1 ;
		i_counter_2 = OLD.counter_2 ;
		i_city_2 = OLD.city_2 ;
		i_street_2 = OLD.street_2 ;
		i_house_2 = OLD.house_2 ;
		i_building_2 = OLD.building_2 ;
		i_flat_2 = OLD.flat_2;

		v_id = max(id_edit)+1 FROM medical_vc.patients_vc WHERE rec_id = i_rec_id;
		NEW.lastupdateby := id FROM library.staffs WHERE staffs.login = current_user;
		NEW.lastupdatedate := now();
		INSERT INTO medical_vc.patients_vc(
		rec_id, id_edit, createby, createdate, lastupdateby, lastupdatedate, deleteby, deletedate, fname, name, oname, birthday, doc_id, doc_serial, doc_number, snils, counter_1, city_1, street_1, house_1, building_1, flat_1, counter_2, city_2, street_2, house_2, building_2, flat_2, v_date, v_action)
				VALUES (	
				i_rec_id,
				v_id,
				i_createby,
				i_createdate,
				i_lastupdateby,
				i_lastupdatedate,
				i_deleteby,
				i_deletedate,
				i_fname,
				i_name,
				i_oname,
				i_birthday,
				i_doc_id,
				i_doc_serial,
				i_doc_number,
				i_snils,
				i_counter_1,
				i_city_1,
				i_street_1,
				i_house_1,
				i_building_1,
				i_flat_1,
				i_counter_2,
				i_city_2,
				i_street_2,
				i_house_2,
				i_building_2,
				i_flat_2,
				date_action,
				'U');
		RETURN NEW;
	ELSIF TG_OP = 'INSERT' THEN
		date_action = now();
		i_rec_id = NEW.id;
		i_createby = id FROM library.staffs WHERE staffs.login = current_user;
		i_createdate = now();
		i_lastupdateby = NEW.lastupdateby ;
		i_lastupdatedate = NEW.lastupdatedate ;
		i_deleteby = NEW.deleteby ;
		i_deletedate = NEW.deletedate ;
		i_fname = NEW.fname ;
		i_name = NEW.name ;
		i_oname = NEW.oname ;
		i_birthday = NEW.birthday ;
		i_doc_id = NEW.doc_id ;
		i_doc_serial = NEW.doc_serial ;
		i_doc_number = NEW.doc_number ;
		i_snils = NEW.snils ;
		i_counter_1 = NEW.counter_1 ;
		i_city_1 = NEW.city_1 ;
		i_street_1 = NEW.street_1 ;
		i_house_1 = NEW.house_1 ;
		i_building_1 = NEW.building_1 ;
		i_flat_1 = NEW.flat_1 ;
		i_counter_2 = NEW.counter_2 ;
		i_city_2 = NEW.city_2 ;
		i_street_2 = NEW.street_2 ;
		i_house_2 = NEW.house_2 ;
		i_building_2 = NEW.building_2 ;
		i_flat_2 = NEW.flat_2;

		NEW.createby := id FROM library.staffs WHERE staffs.login = current_user;
		NEW.createdate := now();
		v_id := 1;
		
		INSERT INTO medical_vc.patients_vc(
		rec_id, id_edit, createby, createdate, lastupdateby, lastupdatedate, deleteby, deletedate, fname, name, oname, birthday, doc_id, doc_serial, doc_number, snils, counter_1, city_1, street_1, house_1, building_1, flat_1, counter_2, city_2, street_2, house_2, building_2, flat_2, v_date, v_action)
				VALUES (	
				i_rec_id,
				v_id,
				i_createby,
				i_createdate,
				i_lastupdateby,
				i_lastupdatedate,
				i_deleteby,
				i_deletedate,
				i_fname,
				i_name,
				i_oname,
				i_birthday,
				i_doc_id,
				i_doc_serial,
				i_doc_number,
				i_snils,
				i_counter_1,
				i_city_1,
				i_street_1,
				i_house_1,
				i_building_1,
				i_flat_1,
				i_counter_2,
				i_city_2,
				i_street_2,
				i_house_2,
				i_building_2,
				i_flat_2,
				date_action,
				'I');


		RETURN NEW;
	ELSIF TG_OP = 'DELETE' THEN
		date_action = now();
		i_rec_id = OLD.id;
		i_createby = OLD.createby;
		i_createdate = OLD.createdate ;
		i_lastupdateby = OLD.lastupdateby ;
		i_lastupdatedate = OLD.lastupdatedate ;
		i_deleteby = id FROM library.staffs WHERE staffs.login = current_user;
		i_deletedate = now();
		i_fname = OLD.fname ;
		i_name = OLD.name ;
		i_oname = OLD.oname ;
		i_birthday = OLD.birthday ;
		i_doc_id = OLD.doc_id ;
		i_doc_serial = OLD.doc_serial ;
		i_doc_number = OLD.doc_number ;
		i_snils = OLD.snils ;
		i_counter_1 = OLD.counter_1 ;
		i_city_1 = OLD.city_1 ;
		i_street_1 = OLD.street_1 ;
		i_house_1 = OLD.house_1 ;
		i_building_1 = OLD.building_1 ;
		i_flat_1 = OLD.flat_1 ;
		i_counter_2 = OLD.counter_2 ;
		i_city_2 = OLD.city_2 ;
		i_street_2 = OLD.street_2 ;
		i_house_2 = OLD.house_2 ;
		i_building_2 = OLD.building_2 ;
		i_flat_2 = OLD.flat_2;

		v_id = max(id_edit)+1 FROM medical_vc.patients_vc WHERE rec_id = i_rec_id;

		INSERT INTO medical_vc.patients_vc(
		rec_id, id_edit, createby, createdate, lastupdateby, lastupdatedate, deleteby, deletedate, fname, name, oname, birthday, doc_id, doc_serial, doc_number, snils, counter_1, city_1, street_1, house_1, building_1, flat_1, counter_2, city_2, street_2, house_2, building_2, flat_2, v_date, v_action)
				VALUES (	
				i_rec_id,
				v_id,
				i_createby,
				i_createdate,
				i_lastupdateby,
				i_lastupdatedate,
				i_deleteby,
				i_deletedate,
				i_fname,
				i_name,
				i_oname,
				i_birthday,
				i_doc_id,
				i_doc_serial,
				i_doc_number,
				i_snils,
				i_counter_1,
				i_city_1,
				i_street_1,
				i_house_1,
				i_building_1,
				i_flat_1,
				i_counter_2,
				i_city_2,
				i_street_2,
				i_house_2,
				i_building_2,
				i_flat_2,
				date_action,
				'D');

		RETURN OLD;
	END IF;
END;
